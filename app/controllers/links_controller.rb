class LinksController < ApplicationController

  Common_length = 6

  def generate_anon
    loop do
           @generated_link = Link.generate_string Common_length
           break if Link.unique?(@generated_link)
    end
    Link.create :new_link => @generated_link,
                :parent_link => params[:input_link],
                :user_id => 1
    render plain: params[:input_link] + " => " + root_url + @generated_link + "<br/>"
  end

  def redirect_user_link
      requested_link = Link.find_by new_link: params[:path]
      redirect_to requested_link.parent_link
  end

  def public
    @index = 0
    @public_records = []
    Link.find_each do |link|
     @public_records[@index] = link
      @index += 1
    end
  end

  def public_search

  end

  def private
  end

end
