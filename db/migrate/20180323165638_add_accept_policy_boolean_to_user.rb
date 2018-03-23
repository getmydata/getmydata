class AddAcceptPolicyBooleanToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :agree_with_policy, :boolean, default: false
  end
end
