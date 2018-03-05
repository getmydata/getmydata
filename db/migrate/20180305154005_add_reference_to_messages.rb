class AddReferenceToMessages < ActiveRecord::Migration[5.1]
  def change
    add_reference :messages, :user, foreign_key: true
    add_reference :messages, :company, foreign_key: true
  end
end
