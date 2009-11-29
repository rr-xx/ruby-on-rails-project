class ExerciseGroup < ActiveRecord::Base
  
  belongs_to :course_instance
  
  has_many :registrations
  has_many :users, :through => :registrations
  
  named_scope :has_registrations, :joins => :registrations
  
  def title
    self.number.to_s + " " + self.lecture_time
  end
  
end
