class AddBorrowerIdToCopies < ActiveRecord::Migration[7.1]
  def change
    add_column :copies, :borrower_id, :integer
    add_foreign_key :copies, :users, column: :borrower_id
    add_index :copies, :borrower_id
  end
end
