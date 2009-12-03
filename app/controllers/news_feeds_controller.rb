class NewsFeedsController < ApplicationController
  
  def index
    @feeds = NewsFeed.all
    respond_to do |format|
      format.atom
    end
  end
end
