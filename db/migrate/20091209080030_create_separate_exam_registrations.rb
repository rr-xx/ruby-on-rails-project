class CreateSeparateExamRegistrations < ActiveRecord::Migration
  def self.up
    create_table :separate_exam_registrations do |t|
      t.integer :user_id
      t.integer :separate_exam_id

      t.timestamps
    end
  end

  def self.down
    drop_table :separate_exam_registrations
  end
end
