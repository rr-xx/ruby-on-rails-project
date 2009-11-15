class User < ActiveRecord::Base
  
  validates_uniqueness_of :name
  validates_confirmation_of :password

  def before_create
    self.password = Password::update(self.password)
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
