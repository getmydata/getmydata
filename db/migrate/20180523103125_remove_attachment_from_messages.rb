class RemoveAttachmentFromMessages < ActiveRecord::Migration[5.1]
  def change
    remove_column :messages, :attachment, :string
  end
end
