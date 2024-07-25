class ChangeDueDateToDatetimeInCopies < ActiveRecord::Migration[7.1]
  def change
    change_column :copies, :due_date, :datetime
  end
end
