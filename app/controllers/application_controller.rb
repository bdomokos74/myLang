class ApplicationController < ActionController::Base
  protect_from_forgery
  include SessionsHelper
  helper_method :current_user  
  
  def sorted_tag_array
    tag_array = Array.new
    tags = Item.tag_counts_on(:tags)
    tags.each do |t|       
      tag_array << { :name => t.name, :id => t.id}
    end
    tag_array.sort! { |x,y| x[:name] <=> y[:name] }
    return tag_array
  end
  
  def missed_words_array
    missed = MissedWord.where(:user_id => @user.id).limit(50).order("count DESC").all
  end
  
end
