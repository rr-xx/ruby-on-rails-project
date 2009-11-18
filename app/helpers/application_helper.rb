# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  
  def my_date
    Time.now.to_s :my_date
  end
  
  def current_user
    User.find_by_id(session[:user])
  end
  
end