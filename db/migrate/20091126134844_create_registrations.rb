class CreateRegistrations < ActiveRecord::Migration
  def self.up
    create_table :registrations do |t|
      t.integer :user_id
      t.integer :exercise_group_id

      t.timestamps
    end
    add_index :registrations, [:user_id, :exercise_group_id], :unique => true
  end

  def self.down
    drop_table :registrations
  end
end
