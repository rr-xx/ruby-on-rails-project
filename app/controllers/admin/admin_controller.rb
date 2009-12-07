class Admin::AdminController < ApplicationController
  
  skip_filter :authenticate, :locale_initialization

  rescue_from  Acl9::AccessDenied, :with => :no_access
  
  def no_access
    render :text => "Pois täältä!! NYT!!"
  end
  
  access_control do
    allow :admin
  end
  
end
