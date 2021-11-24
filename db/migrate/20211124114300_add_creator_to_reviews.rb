class AddCreatorToReviews < ActiveRecord::Migration[6.1]
  def change
    add_column :reviews, :creator, :string
  end
end
