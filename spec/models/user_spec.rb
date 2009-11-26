
require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')


describe User do
  before(:each) do
    @valid_attributes = {
      :name => "john",
      :password => "secretret"
    }
    
    @valid_user = User.new(@valid_attributes)
  end

  describe "creation" do
    it "should create a new instance given valid attributes" do
      User.create!(@valid_attributes)
    end
    
    it "should lowercase username" do
       user = User.create!(@valid_attributes.merge({:name => "jOhN"}))
       user.name.should == "john"
    end
  end

  describe "validation" do
    it "should require username to be between 3 and 15 characters" do
      user = User.new(@valid_attributes)
      user.should be_valid
      
      user.name = "ab"
      user.should_not be_valid
      
      user.name = "a"*16
      user.should_not be_valid
    end
    
    it "should have a password" do
      @valid_user.password = ""
      @valid_user.should have(1).errors_on(:password)
    end
    
    it "should require confirmation of password" do
      @valid_user.password_confirmation = "foobar"
      @valid_user.should_not be_valid
    end
    
  end
  
end
