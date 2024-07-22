class Book < ApplicationRecord
  has_many :copies, dependent: :destroy

  validates :title, presence: true
  validates :author, presence: true
  validates :isbn, presence: { message: "can't be blank" },
            uniqueness: { message: "must be unique" },
            numericality: { only_integer: true, message: "must be a number"},
            length: { is: 13, message: "must be 13 digits long"}



end
