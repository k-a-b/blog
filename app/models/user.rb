class User < ApplicationRecord
  has_secure_password
  has_many :messages, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :commented_messages, through: :comments, source: :commentable, source_type: :Message
  has_many :commented_users, through: :comments, source: :commentable, source_type: :User

  validates :password, presence: true
  validates :email, presence: true, uniqueness: true

  def self.authenticate(email, password)
    user = find_by_email(email)
    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
      user
    else
      nil
    end
  end

  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end

end
