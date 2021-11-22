class CreateInfluencers < ActiveRecord::Migration[6.1]
  def change
    create_table :influencers do |t|
      t.string :ig_username
      t.integer :ig_followers
      t.string :youtube_channel_name
      t.integer :youtube_subscribers
      t.string :twitter_username
      t.integer :twitter_followers
      t.string :facebook_username
      t.integer :facebook_followers
      t.string :gender
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
