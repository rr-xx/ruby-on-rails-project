class User < ActiveRecord::Base
  
  validates_uniqueness_of :name, :message => "Tunnus on jo käytössä"
  validates_confirmation_of :password

  def before_save
    if self.password.length < 150 #this is häck!
      self.password = Password::update(self.password)      
    end
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
