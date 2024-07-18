class CreateCopies < ActiveRecord::Migration[7.1]
  def change
    create_table :copies do |t|
      t.references :book, null: false, foreign_key: true
      t.string :borrower, null: false
      t.timestamp :due_date, null: false

      t.timestamps
    end
  end
end
