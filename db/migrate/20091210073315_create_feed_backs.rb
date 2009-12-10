class CreateFeedBacks < ActiveRecord::Migration
  def self.up
    create_table :feed_backs do |t|
      t.text :feed_back
      t.integer :course_id

      t.timestamps
    end
  end

  def self.down
    drop_table :feed_backs
  end
end
