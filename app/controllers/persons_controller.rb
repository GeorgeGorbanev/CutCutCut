class PersonsController < ApplicationController
  def profile
    redirect_to ("tools#private")
  end
end
