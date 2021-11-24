class AddEstimatedpriceToInfluencer < ActiveRecord::Migration[6.1]
  def change
    add_column :influencers, :estimated_price, :integer
  end
end
