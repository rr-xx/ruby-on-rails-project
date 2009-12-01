class AddCourseInstanceToRegistration < ActiveRecord::Migration
  def self.up
    add_column :registrations, :course_instance_id, :integer
    
    add_index :registrations, [:course_instance_id, :user_id], :unique => true
  end
  
  

  def self.down
    remove_column :registrations, :course_instance_id
  end
end
