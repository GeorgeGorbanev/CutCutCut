class Link < ApplicationRecord
  belongs_to :user
  has_many :transitions

  def generate_link(length)
    valid_symbols = "abcdefghikjklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
    result_link = ""
    length.times do
      next_symbol = valid_symbols[rand(62)]
      result_link = result_link + next_symbol
    end
    # check db
    return result_link
  end
end
