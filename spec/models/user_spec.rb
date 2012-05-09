# == Schema Information
#
# Table name: users
#
#  id                 :integer(4)      not null, primary key
#  name               :string(255)
#  email              :string(255)
#  encrypted_password :string(255)
#  salt               :string(255)
#  admin              :boolean(1)
#  created_at         :datetime
#  updated_at         :datetime
#

require 'spec_helper'

describe User do
  before(:each) do
    @attr = {
      :name => "Philip Shekwolo",
      :email => "phil@gmail.com",
      :password => "foobar",
      :password_confirmation => "foobar"
    }
  end

  it "should create a new instance given a valid attribute" do
    User.create!(@attr)
  end

  it "should require a name" do
    no_name_user = User.new(@attr.merge(:name => ""))
    no_name_user.should_not be_valid
  end

  it "should require an email" do
    no_email_user = User.new(@attr.merge(:email => ""))
    no_email_user.should_not be_valid
  end

  it "should reject invalid email address" do
    addresses = %w[user@foo,com user_at_foo.org example.user@foo.]
    addresses.each do |address|
      invalid_user = User.new(@attr.merge(:email => address))
      invalid_user.should_not be_valid
    end
  end

  it "should accept valid email address" do
    addresses = %w[user@foo.com user@foo.co.uk user.name@foo.jp USER_NAME@foo.com]
    addresses.each do |address|
      valid_email = User.new(@attr.merge(:email => address))
      valid_email.should be_valid
    end
  end

  it "should reject duplicate email address" do
    User.create!(@attr)
    duplicate_user = User.new(@attr)
    duplicate_user.should_not be_valid
  end


  describe "password" do

    before(:each) do
      @user = User.new(@attr)
    end

    it "should have a password attribute" do
      @user.should respond_to(:password)
    end

    it "should have a password confirmation attribute" do
      @user.should respond_to(:password_confirmation)
    end
  end


  describe "password validations" do

    it "should require a password" do
      User.new(@attr.merge(:password => "", :password_confirmation => "")).
        should_not be_valid
    end

    it "should require matching password confirmation" do
      User.new(@attr.merge(:password_confirmation => "invalid")).
        should_not be_valid
    end
  end

  describe "password encryption" do

    before(:each) do
      @user = User.create!(@attr)
    end

    it "should an encrypted password attribute" do
      @user.should respond_to(:encrypted_password)
    end

    it "should set the encrypted password attribute" do
      @user.encrypted_password.should_not be_blank
    end

    it "should have a salt attribute" do
      @user.should respond_to(:salt)
    end

    describe "has_password? method" do

      it "should exist" do
        @user.should respond_to(:has_password?)
      end

      it "should return false if the passwords dont match" do
        @user.has_password?("invalid").should be_false
      end
    end

    describe "authenticate method" do

      it "should exist" do
        User.should respond_to(:authenticate)
      end

      it "should return nil on email/password mismatch" do
        User.authenticate(@attr[:email], "wrongpass").should be_nil
      end

      it "should return nil for an email address with no user" do 
        User.authenticate("boo@foo.com", @attr[:password]).should be_nil
      end

      it "should return the user on email/password match" do
        User.authenticate(@attr[:email], @attr[:password]).should == @user
      end
    end
  end

  describe "admin attribute" do

    before(:each) do
      @user = User.create!(@attr)
    end

    it "should respond to admin" do
      @user.should respond_to(:admin)
    end

    it "should not be an admin by default" do
      @user.should_not be_admin
    end

    it "should be convertible to an admin" do
      @user.toggle!(:admin)
      @user.should be_admin
    end
  end
end
