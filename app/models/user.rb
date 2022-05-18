class User < ApplicationRecord

  has_secure_password

  has_many :bank_accounts, class_name: "BankAccount"
  has_many :categories   , class_name: "Category"

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
