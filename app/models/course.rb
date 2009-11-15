class Course < ActiveRecord::Base
   validates_presence_of :name, :description
   validates_length_of :name, :minimum => 5
   
   
end
