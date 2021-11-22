class AddColumnsToCampaigns < ActiveRecord::Migration[6.1]
  def change
    add_column :campaigns, :archived, :boolean, default: false
    add_column :campaigns, :start_date, :date
    add_column :campaigns, :end_date, :date
    add_column :campaigns, :description, :text
    add_column :campaigns, :budget, :integer
  end
end
