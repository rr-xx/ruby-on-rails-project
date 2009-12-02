class AddCourseIdToNewsFeed < ActiveRecord::Migration
  def self.up
    add_column :news_feeds, :course_id, :integer
  end

  def self.down
    remove_column :news_feeds, :course_id
  end
end
