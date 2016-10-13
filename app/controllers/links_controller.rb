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
    render plain: params[:input_link] + " => " + @generated_link + "<br/>"
  end

end
