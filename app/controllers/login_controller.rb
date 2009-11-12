class LoginController < ApplicationController
  
skip_filter :authenticate, :only => [:new, :create]

def new
  
end

def create
  session[:user] = true
  redirect_to root_path
end

def destroy
  reset_session
  redirect_to root_path
end
  
end
