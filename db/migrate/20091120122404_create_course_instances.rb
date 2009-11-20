class CreateCourseInstances < ActiveRecord::Migration
  def self.up
    create_table :course_instances do |t|
      t.integer :number
      t.string :lecture_time
      
      t.integer :course_id

      t.timestamps
    end
  end

  def self.down
    drop_table :course_instances
  end
end
