class CreateCopies < ActiveRecord::Migration[7.1]
  def change
    create_table :copies do |t|
      t.integer :book_id, null: false
      t.string :borrower, null: false
      t.string :due_date, null: false

      t.timestamps
    end
  end
end
