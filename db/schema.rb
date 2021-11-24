# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_11_24_114545) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "businesses", force: :cascade do |t|
    t.string "company_name"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_businesses_on_user_id"
  end

  create_table "campaigns", force: :cascade do |t|
    t.string "name"
    t.bigint "business_id", null: false
    t.string "location"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "archived", default: false
    t.date "start_date"
    t.date "end_date"
    t.text "description"
    t.integer "budget"
    t.boolean "visibility", default: true
    t.index ["business_id"], name: "index_campaigns_on_business_id"
  end

  create_table "influencers", force: :cascade do |t|
    t.string "ig_username"
    t.integer "ig_followers"
    t.string "youtube_channel_name"
    t.integer "youtube_subscribers"
    t.string "twitter_username"
    t.integer "twitter_followers"
    t.string "facebook_username"
    t.integer "facebook_followers"
    t.string "gender"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "estimated_price"
    t.index ["user_id"], name: "index_influencers_on_user_id"
  end

  create_table "proposals", force: :cascade do |t|
    t.string "title"
    t.string "status", default: 'pending'
    t.boolean "accepted", default: false
    t.bigint "campaign_id", null: false
    t.bigint "influencer_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "creator"
    t.index ["campaign_id"], name: "index_proposals_on_campaign_id"
    t.index ["influencer_id"], name: "index_proposals_on_influencer_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.string "content"
    t.integer "rating"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "proposal_id", null: false
    t.string "creator"
    t.index ["proposal_id"], name: "index_reviews_on_proposal_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "role"
    t.string "phone_number"
    t.string "first_name"
    t.string "last_name"
    t.string "location"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "businesses", "users"
  add_foreign_key "campaigns", "businesses"
  add_foreign_key "influencers", "users"
  add_foreign_key "proposals", "campaigns"
  add_foreign_key "proposals", "influencers"
  add_foreign_key "reviews", "proposals"
end
