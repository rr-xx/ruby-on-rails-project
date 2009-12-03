class NewsFeed < ActiveRecord::Base
  

  belongs_to :user
  belongs_to :exercise_group
  belongs_to :course
  
  default_scope :order => 'created_at DESC', :limit => 10
  
  def title
    "a"
  end
  
  def user_registration?
    return (user and (! (exercise_group)))
  end
  
  def group_registration?
    return exercise_group
  end
  
  def course_creation?
    return course
  end

  def self.new_user_registration(user)
    NewsFeed.create! :user => user 
  end
  
  def self.new_course_created course
    NewsFeed.create! :course => course 
  end
  
  def self.new_group_registration registration
    NewsFeed.create! :exercise_group => registration.exercise_group, :user => registration.user
    
  end
  
end
