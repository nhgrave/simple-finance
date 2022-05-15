class User < ApplicationRecord

  has_secure_password

  before_save :downcase_email

  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }, presence: true, uniqueness: true

  def self.current= user
    Thread.current[:user_id] = user.try :id
  end

  def self.current
    User.find_by id: Thread.current[:user_id]
  end

  private

  def downcase_email
    self.email = email.downcase
  end

end
