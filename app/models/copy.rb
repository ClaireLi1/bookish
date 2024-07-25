class Copy < ApplicationRecord
  belongs_to :book
  belongs_to :borrower, class_name: 'User', optional: true, inverse_of: :borrowed_copies


  validate :borrower_must_exist, if: -> { borrower_id.present? }

  def borrower_must_exist
    unless User.exists?(id: borrower_id)
      errors.add(:borrower_id, 'must refer to a valid user')
    end
  end
end
