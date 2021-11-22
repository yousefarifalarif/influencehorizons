class AddProposalsToReviews < ActiveRecord::Migration[6.1]
  def change
    add_reference :reviews, :proposal, null: false, foreign_key: true
  end
end
