class LinksController < ApplicationController

  COMMON_LENGTH = 6
  DEFAULT_TABLE_SIZE = 10

  def generate_anon
    loop do
           @generated_link = Link.generate_string COMMON_LENGTH
           break if Link.unique?(@generated_link)
    end
    Link.create :new_link => @generated_link, :parent_link => params[:input_link], :user_id => 1
    render plain: params[:input_link] + " => " + root_url + @generated_link + "<br/>"
  end

  def redirect_user_link
      requested_link = Link.find_by new_link: params[:path]
      if requested_link != nil
        requested_link.click_count += 1
        requested_link.save
        redirect_to requested_link.parent_link
      else
        render plain: "404"
      end
  end

  def public
    @main_path = root_url + "links/public/"
    if params[:commit] == "Search"
      if params[:search_column] == "parent"
        @links_table = Link.where("parent_link LIKE ? AND user_id  LIKE ?", "%"+ params[:input_link] +"%", 1).reverse_order
      elsif params[:search_column] == "child"
        @links_table = Link.where("new_link LIKE ? AND user_id  LIKE ?", "%"+ params[:input_link] +"%", 1).reverse_order
      end
      params[:page] == nil ? @page_number = 1 : @page_number = params[:page].to_i
      redirect_to root_url + "links/public" if @page_number < 1
    else
      @links_table = Link.where(:user_id => 1).reverse_order
      params[:page] == nil ? @page_number = 1 : @page_number = params[:page].to_i
      redirect_to root_url + "links/public" if @page_number < 1
    end
  end

  def private
  end

end
