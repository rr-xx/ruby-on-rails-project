class RemoveNumberFromCourseInstance < ActiveRecord::Migration
  def self.up
    remove_column :course_instances, :number
  end

  def self.down
    add_column :course_instances, :number, :integer
  end
end
