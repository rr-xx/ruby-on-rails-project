class AddMultipleRegistrationsToCourseInstance < ActiveRecord::Migration
  def self.up
    add_column :course_instances, :multiple_registrations, :boolean
  end

  def self.down
    remove_column :course_instances, :multiple_registrations
  end
end
