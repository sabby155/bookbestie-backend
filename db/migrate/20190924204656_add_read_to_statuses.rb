class AddReadToStatuses < ActiveRecord::Migration[5.2]
  def change
    add_column :statuses, :read, :boolean
  end
end
