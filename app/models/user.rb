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

class User < ActiveRecord::Base
  attr_accessor :password

  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :name, :presence => true, :uniqueness => { :case_sensitive => false }
  validates :email, :presence => true, :uniqueness => true, :format => { :with => EMAIL_REGEX }
  validates :password, :presence => true, :confirmation => true

  before_save :encrypt_password

  def has_password?(submitted_password)
    encrypted_password == encrypt(submitted_password)
  end

  class << self
    def authenticate(email, submitted_password)
      user = find_by_email(email)
      (user && user.has_password?(submitted_password)) ? user : nil
    end

    def authenticate_with_salt(id, cookie_salt)
      user = find_by_id(id)
      (user && user.salt == cookie_salt) ? user : nil
    end
  end

  private

  def encrypt_password
    self.salt = make_salt unless has_password?(password)
    self.encrypted_password = encrypt(password)
  end

  def encrypt(string)
    secure_hash("#{salt}--#{string}")
  end

  def make_salt
    secure_hash("#{Time.now.utc}--#{password}")
  end

  def secure_hash(string)
    Digest::SHA2.hexdigest(string)
  end
end
