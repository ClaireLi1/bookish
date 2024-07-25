class AddAvailableToCopies < ActiveRecord::Migration[7.1]
  def change
    add_column :copies, :available, :boolean, default: false
  end
end
