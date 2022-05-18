class Category < ApplicationRecord

  has_one :user, class_name: "User"

  validates :name, presence: true

end
