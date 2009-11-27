# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  
  include UserAuthentication
  
  def my_date
    Time.now.to_s :my_date
  end
  
  
  
end