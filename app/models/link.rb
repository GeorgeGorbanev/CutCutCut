class Link < ApplicationRecord

  belongs_to :user
  has_many :transitions

  def self.unique?(generated_link)
    if !Link.find_by(new_link: generated_link)
      return true
    else
      return false
    end
  end

  def self.generate_string(length)
    valid_symbols = "abcdefghikjklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
    result_string = ""
    length.times do
      next_symbol = valid_symbols[rand(62)]
      result_string += next_symbol
    end
    return result_string
  end

end
