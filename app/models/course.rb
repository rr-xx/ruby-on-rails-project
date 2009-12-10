class Course < ActiveRecord::Base
   validates_presence_of :name
   validates_length_of :name, :minimum => 5
   
   has_many :course_instances, :dependent => :destroy
   
   has_many :separate_exams, :dependent => :destroy
   
   has_many :feed_backs, :dependent => :destroy
   
   belongs_to :category
   
   named_scope :active_ones
   
   named_scope :uncategorized, :conditions => "category_id is null"

   def after_create
     NewsFeed.new_course_created self
   end
   
end
