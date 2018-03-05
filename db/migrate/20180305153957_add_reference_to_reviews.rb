class AddReferenceToReviews < ActiveRecord::Migration[5.1]
  def change
    add_reference :reviews, :user, foreign_key: true
    add_reference :reviews, :company, foreign_key: true
  end
end
