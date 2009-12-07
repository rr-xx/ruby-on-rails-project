class Friend < ActiveRecord::Base
  belongs_to :participant, :class_name => 'User'
  belongs_to :friend, :class_name => 'User'
end
