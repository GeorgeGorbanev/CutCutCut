class LinksController < ApplicationController

  def new
    if params[:type] == "random_public"
      new_link = Link.generate params[:input_link]
      if new_link == nil
        render plain: "Error: wrong link format"
        return nil
      end
      render plain: "Your new link: "+ "<span id = \"new_url\">" + root_url + new_link + "  </span>" +
          "<a class = \"btn-clipboard\" data-clipboard-target=\"#new_url\"><span class=\"glyphicon glyphicon-copy\" aria-hidden=\"true\"></span>Click to copy</a>"
    elsif params[:type] == "custom"
      result = Link.custom_create params[:user].to_i, params[:child_link], params[:parent_link], params[:generate]
      if !result
        render plain: "Error: wrong child format"
        return nil
      end
      if result == "Already exist"
        render plain: "Sorry, your link: " + root_url + params[:child_link] + " is already exist"
        return
      end
      render plain: "Success! Your new link: " + "<span id = \"new_url\">" + root_url + result + "</span>  " +
          "<a class = \"btn-clipboard\" data-clipboard-target=\"#new_url\"><span class=\"glyphicon glyphicon-copy\" aria-hidden=\"true\"></span>Click to copy</a>"
    end
  end

  def redirect_user_link
      requested_link = Link.find_by id: params[:path]
      if requested_link != nil
        user_agent = Browser.new request.env['HTTP_USER_AGENT']
        requested_link.click_count += 1
        Transition.create link_id: params[:path],
                          ip: request.remote_ip,
                          browser: user_agent,
                          platform: user_agent.platform,
                          click_number: requested_link.click_count
        requested_link.save
        redirect_to requested_link.parent_link
      else
        render file: "#{Rails.root}/public/404.html", layout: false, status: 404
      end
  end

  def index
    params[:type] = "public" if params[:type] == nil
    params[:user_id] = current_user.id if current_user != nil
    redirect_to new_user_session_path if params[:type] == "private" && !user_signed_in?
    params[:commit] == "Search" ?  @links_table = Link.search_table(params) :
                                   @links_table = Link.last_table(params)
  end

  def link_info # здесь не совсем rails way, слишком много вложений и логика топорная. позже исправить, если будет время
      @link_record = Link.find_by id: params[:link_id]
      if @link_record != nil                                                               # существует запись
        if @link_record[:user_id] != 1                                                     # приватная запись
          if current_user                                                                  # пользователь залогинен
           if current_user.id == @link_record[:user_id]                                    # имеет доступ к ссылке
             @table_transactions = Transition.find_by(link_id: params[:link_id]).reverse_order
             params[:page] == nil ? @page_number = 1 : @page_number = params[:page].to_i
             redirect_to root_url + "links/" if @page_number < 1
           else
             redirect_to root_url
           end
          else
            redirect_to root_url
          end
        else                                                                               # запись публичная
         @table_transactions = Transition.find_by(link_id: params[:link_id]).reverse_order
         params[:page] == nil ? @page_number = 1 : @page_number = params[:page].to_i
         redirect_to root_url + "links/" if @page_number < 1
        end
      else
        redirect_to root_url
      end
  end

  end