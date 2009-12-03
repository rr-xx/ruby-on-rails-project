class Admin::AdminController < ApplicationController
  
  skip_filter :authenticate, :locale_initialization
  
  access_control do
    allow :admin
  end
  
end
