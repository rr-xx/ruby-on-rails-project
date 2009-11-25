class Admin::AdminController < ApplicationController
  
  skip_filter :authenticate, :locale_initialization
  
end
