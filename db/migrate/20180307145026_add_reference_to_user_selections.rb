class AddReferenceToUserSelections < ActiveRecord::Migration[5.1]
  def change
      add_reference :user_selections, :user, foreign_key: true
      add_reference :user_selections, :company, foreign_key: true
  end
end
