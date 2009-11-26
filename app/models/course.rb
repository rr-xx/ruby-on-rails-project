class Course < ActiveRecord::Base
   validates_presence_of :name
   validates_length_of :name, :minimum => 5
   
   has_many :course_instances, :dependent => :destroy
   
   named_scope :active_ones

   
   
end
