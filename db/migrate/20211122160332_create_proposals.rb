class CreateProposals < ActiveRecord::Migration[6.1]
  def change
    create_table :proposals do |t|
      t.string :title
      t.string :status, default: 'pending'
      t.boolean :accepted, default: false
      t.references :campaign, null: false, foreign_key: true
      t.references :influencer, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
