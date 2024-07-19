class Copy < ApplicationRecord
  belongs_to :book
  belongs_to :borrower, class_name: 'User', optional: true

  # validates :borrower, presence: true
  # validates :due_date, presence: true
end
