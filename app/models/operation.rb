class Operation < ApplicationRecord

  belongs_to :user        , class_name: "User"
  belongs_to :bank_account, class_name: "BankAccount"
  belongs_to :category    , class_name: "Category"   , optional: true

  before_validation :set_paid_at

  validates :description, presence: true
  validates :amount     , numericality: true
  validates :issue_at   , presence: true
  validates :due_at     , presence: true
  validates :paid_at    , presence: true

  before_save :set_total

  def amount= value
    write_attribute :amount, value.to_f.abs
  end

  def flow_out?
    !flow_in?
  end

  def open?
    !paid?
  end

  private

  def set_paid_at
    self.paid_at = self.due_at unless paid?
  end

  def set_total
    self.total = amount * (flow_in? ? 1 : -1)
  end
end
