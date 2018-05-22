class RemoveCountryFromUsers < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :sign_in_count, :integer
    remove_column :users, :current_sign_in_ip, :integer
    remove_column :users, :last_sign_in_ip, :integer
  end
end
