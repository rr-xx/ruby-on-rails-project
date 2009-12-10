class FeedBacksController < ApplicationController
  
  def create
    @feed_back = FeedBack.new params[:feed_back]
    @feed_back.course = Course.find_by_id params[:id]
    @feed_back.save
    redirect_to :back
  end
  
end
