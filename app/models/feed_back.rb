class FeedBack < ActiveRecord::Base
  
  validates_presence_of :feed_back
  
  belongs_to :course
  
end
