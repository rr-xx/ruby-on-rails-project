class AddStudentNumberToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :student_number, :string
  end

  def self.down
    remove_column :users, :student_number
  end
end
