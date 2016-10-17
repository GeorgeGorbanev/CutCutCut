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
      redirect_to requested_link.parent_link
  end

  def public
    params[:page_number] == nil ? @page_number = 1 : @page_number = params[:page_number].to_i
    redirect_to public_path if @page_number < 1
    @links_table = Link.where(:user_id => 1).reverse_order
  end

  def public_search

  end

  def private
  end

end
