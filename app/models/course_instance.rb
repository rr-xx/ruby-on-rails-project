class CourseInstance < ActiveRecord::Base
  
  belongs_to :course
  has_many :exercise_groups
  
  named_scope :active_ones

end
