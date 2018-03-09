class ChangeColumnSentInMessages < ActiveRecord::Migration[5.1]
  def change
    rename_column :messages, :sent, :sent_by_user
  end
end
