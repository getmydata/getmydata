class ChangeColumnSentDefaultValue < ActiveRecord::Migration[5.1]
  def change
    change_column :messages, :sent_by_user, :boolean, :default => false
  end
end
