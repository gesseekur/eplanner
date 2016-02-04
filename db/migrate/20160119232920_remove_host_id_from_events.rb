class RemoveHostIdFromEvents < ActiveRecord::Migration
  def change
    remove_column :events, :host_id, :integer
  end
end
