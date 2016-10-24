class Link < ApplicationRecord

  COMMON_LENGTH = 6

  self.primary_key = :id
  belongs_to :user
  has_many :transitions

  def self.custom_create user_id, child, parent, random
    return nil if !Link.url_validation parent
    return nil if Link.child_validation child == false && random == "off"
    if random == "on"
      return generate parent, user_id
    else
      if Link.find_by(:id => child) == nil
        Link.create :id => child, :parent_link => parent, :user_id => user_id
        return child
      else
        return nil
      end
    end
  end

  def self.generate parent_link, user_id = 1, length = COMMON_LENGTH
    return nil if !Link.url_validation parent_link
    generated_link = ""
    loop do
      generated_link = Link.generate_string length
      break if Link.find_by(id: generated_link) == nil
    end
    Link.create :id => generated_link, :parent_link => parent_link, :user_id => user_id
    return generated_link
  end

  def self.generate_string length
    valid_symbols = "abcdefghikjklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789-_"
    result_string = ""
    length.times do
      next_symbol = valid_symbols[rand(62)]
      result_string += next_symbol
    end
    return result_string
  end

  def self.last_table params
    if params[:type] == "private"
      links_table = Link.where(:user_id => params[:user_id]).order("created_at DESC")
    elsif params[:type] == "public"
      links_table = Link.where(:user_id => 1).order("created_at DESC")
    end
    return links_table
  end

  def self.search_table params
    params[:user_id] && params[:type] == "private" ? user_id = params[:user_id] : user_id = 1
    search_query = " LIKE ? AND user_id  LIKE ?"
    params[:search_column] == "child" ? search_query = "id" + search_query :
                                        search_query = "parent_link" + search_query
    links_table = Link.where(search_query, "%" + params[:input_link] +"%", user_id).order("created_at DESC")
    return links_table
  end

  def self.url_validation string
    require 'uri'
    if string =~ URI::regexp
      return true
    else
      return false
    end
  end

  def self.child_validation string
    if string =~ /^[a-zA-Z0-9-_]+$/
      return true
    else
      return false
    end
  end

end
