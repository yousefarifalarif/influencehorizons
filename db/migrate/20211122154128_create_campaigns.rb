class CreateCampaigns < ActiveRecord::Migration[6.1]
  def change
    create_table :campaigns do |t|
      t.string :name
      t.references :business, null: false, foreign_key: true
      t.string :location

      t.timestamps
    end
  end
end
