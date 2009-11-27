module UserAuthentication
  
  
  protected 
  def current_user
    User.find_by_id(session[:user])
  end
  
end