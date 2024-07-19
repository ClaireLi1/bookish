class ChangeBorrowerAndDueDateToBeNullableInCopies < ActiveRecord::Migration[7.1]
  def change
    change_column_null :copies, :borrower, true
    change_column_null :copies, :due_date, true
  end
end
