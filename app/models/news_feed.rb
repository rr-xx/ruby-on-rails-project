class NewsFeed < ActiveRecord::Base
  

  belongs_to :user
  belongs_to :exercise_group
  belongs_to :course
  
  def user_registration?
    return ! exercise_group
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
    NewsFeed.create! :crouse => course 
  end
  
end
