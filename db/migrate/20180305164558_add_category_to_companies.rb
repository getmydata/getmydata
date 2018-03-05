class AddCategoryToCompanies < ActiveRecord::Migration[5.1]
  def change
    add_column :companies, :category, :string
  end
end
