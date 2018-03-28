class AddAllowTrackingBooleanToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :allow_tracking, :boolean, default: false
  end
end
