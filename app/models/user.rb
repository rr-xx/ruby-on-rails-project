class User < ActiveRecord::Base
  
  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  
  acts_as_authorization_subject
  
  validates_presence_of :name, :password, :unless => :now_editing
  validates_length_of :name, :in => 3..15
  
  validates_uniqueness_of :name, :message => "Tunnus on jo käytössä"
  validates_confirmation_of :password

  attr_accessor :editing, :password_confirmation

  has_many :registrations
  has_many :exercise_groups, :through => :registrations
  
  has_many :slaves, :foreign_key => "participant_id",
                    :class_name => "Friend"
  has_many :friends, :through => :slaves
  
  has_many :masters, :foreign_key => "friend_id",
                     :class_name => "Friend"
  has_many :participants, :through => :masters
  
  named_scope :in_exercise_group, lambda { |id| { :joins => :registrations, :conditions => ['exercise_group_id = ?', id] } }

  def now_editing
    return self.editing
  end

  def after_create
    NewsFeed.new_user_registration(self)
  end

  def before_save
    if self.password != ""
      self.password = Password::update(self.password)      
    else
      u = User.find_by_id(self.id)
      self.password = u.password
    end
    self.name = self.name.downcase
  end
  
  def self.authenticate(arguments)
    user = User.find(:first, :conditions => ['name = ?', arguments[:name]])
    if user and Password::check(arguments[:password],user.password)
      return user
    else
      raise ArgumentError
    end
  end

end
