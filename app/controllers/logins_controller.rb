class LoginsController < ApplicationController
  
skip_filter :authenticate, :only => [:new, :create]

def new
  
end

def create
  begin
    user = User.authenticate(params[:login])
  rescue ArgumentError
  	redirect_to new_login_path
    flash[:warn] = "Kirjautuminen epäonnistui."
    return
  end
  session[:user] = user.id
  redirect_to root_path
end

def destroy
  reset_session
  redirect_to root_path
end
  
end
