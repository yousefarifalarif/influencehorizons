class AddVisibilityToCampaign < ActiveRecord::Migration[6.1]
  def change
    add_column :campaigns, :visibility, :boolean, default: true
  end
end
