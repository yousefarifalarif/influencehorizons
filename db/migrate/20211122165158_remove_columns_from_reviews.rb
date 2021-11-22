class RemoveColumnsFromReviews < ActiveRecord::Migration[6.1]
  def change
    remove_reference :reviews, :business, null: false, foreign_key: true
    remove_reference :reviews, :influencer, null: false, foreign_key: true
  end
end
