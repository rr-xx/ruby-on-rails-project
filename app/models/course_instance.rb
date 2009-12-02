class CourseInstance < ActiveRecord::Base
  
  belongs_to :course
  has_many :exercise_groups, :dependent => :destroy
  
  named_scope :active_ones
  
  def can_register? user
    if multiple_registrations
      return true
    else 
      exercise_groups.each do | group |
        if group.users.include? user
          return false
        end
      end
    end
    return true
  end

end
