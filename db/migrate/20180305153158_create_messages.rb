class CreateMessages < ActiveRecord::Migration[5.1]
  def change
    create_table :messages do |t|
      t.datetime :date
      t.boolean :sent
      t.string :subject
      t.text :text
      t.integer :request_id
      t.string :attachment

      t.timestamps
    end
  end
end
