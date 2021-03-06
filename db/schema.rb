# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20091210073315) do

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "course_instances", :force => true do |t|
    t.string   "lecture_time"
    t.integer  "course_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "multiple_registrations"
  end

  create_table "courses", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "category_id"
  end

  create_table "exercise_groups", :force => true do |t|
    t.integer  "number"
    t.string   "lecture_time"
    t.integer  "course_instance_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "feed_backs", :force => true do |t|
    t.text     "feed_back"
    t.integer  "course_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "friends", :force => true do |t|
    t.integer  "friend_id"
    t.integer  "participant_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "news_feeds", :force => true do |t|
    t.integer  "user_id"
    t.integer  "exercise_group_id"
    t.string   "message"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "course_id"
  end

  create_table "registrations", :force => true do |t|
    t.integer  "user_id"
    t.integer  "exercise_group_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "course_instance_id"
  end

  add_index "registrations", ["course_instance_id", "user_id"], :name => "index_registrations_on_course_instance_id_and_user_id", :unique => true
  add_index "registrations", ["user_id", "exercise_group_id"], :name => "index_registrations_on_user_id_and_exercise_group_id", :unique => true

  create_table "roles", :force => true do |t|
    t.string   "name",              :limit => 40
    t.string   "authorizable_type", :limit => 40
    t.integer  "authorizable_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles_users", :id => false, :force => true do |t|
    t.integer  "user_id"
    t.integer  "role_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "separate_exam_registrations", :force => true do |t|
    t.integer  "user_id"
    t.integer  "separate_exam_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "separate_exams", :force => true do |t|
    t.string   "name"
    t.integer  "course_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.text     "password"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "student_number"
    t.string   "email",               :null => false
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

end
