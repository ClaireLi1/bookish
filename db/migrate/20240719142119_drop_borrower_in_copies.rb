class DropBorrowerInCopies < ActiveRecord::Migration[7.1]
  def change
    remove_column :copies, :borrower
  end
end
