class RemoveIdentificationFromUser < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :identification, :string
  end
end
