class CreateSeparateExams < ActiveRecord::Migration
  def self.up
    create_table :separate_exams do |t|
      t.string :name
      t.integer :course_id

      t.timestamps
    end
  end

  def self.down
    drop_table :separate_exams
  end
end
