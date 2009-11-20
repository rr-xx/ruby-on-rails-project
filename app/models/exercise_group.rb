class ExerciseGroup < ActiveRecord::Base
  
  belongs_to :course_instance
  has_many :exercise_groups, :dependent => :destroy
  
end
