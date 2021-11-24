class RemoveUserFromReviews < ActiveRecord::Migration[6.1]
  def change
    remove_reference :reviews, :user, null: false, foreign_key: true
  end
end
