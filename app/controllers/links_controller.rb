class LinksController < ApplicationController

  def new
    if params[:type] == "random_public"
      new_link = Link.generate params[:input_link]
      render plain: params[:input_link] + " => " + root_url + new_link + "<br/>"
    elsif params[:type] == "custom"
      Link.custom_create params[:user].to_i, params[:child_link], params[:parent_link], params[:generate]
    end
  end

  def redirect_user_link
      requested_link = Link.find params[:path]
      if requested_link != nil
        user_agent = Browser.new request.env['HTTP_USER_AGENT']
        Transition.create link_id: params[:path],
                          ip: request.remote_ip,
                          browser: user_agent,
                          platform: user_agent.platform
        requested_link.click_count += 1
        requested_link.save
        redirect_to requested_link.parent_link
      else
        render plain: "404"
      end
  end

  def index
    params[:user_id] = current_user.id if current_user != nil
    redirect_to new_user_session_path if params[:type] == "private" && !user_signed_in?
    params[:commit] == "Search" ?  @links_table = Link.search_table(params) :
                                   @links_table = Link.last_table(params)
  end

  def link_info
      @table_transactions = Transition.where(:link_id => params[:link_id]).reverse_order
      params[:page] == nil ? @page_number = 1 : @page_number = params[:page].to_i
      redirect_to root_url + "links/" if @page_number < 1
  end

end
