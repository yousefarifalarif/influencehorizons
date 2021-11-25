# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
User.destroy_all
influencers = []

# Create 10 Influencers
puts "Creating Influencers ..."
11.times do
  user = User.create!(email: Faker::Internet.email, password: "123456", phone_number: Faker::PhoneNumber.cell_phone_in_e164,
                      first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, location: "London", role: "Influencer")
  username = Faker::Twitter.screen_name
  followers = rand(1000..200_000)
  influencer = Influencer.new(ig_username: username, ig_followers: followers,
                              youtube_channel_name: username, youtube_subscribers: followers,
                              twitter_username: username, twitter_followers: followers,
                              facebook_username: username, facebook_followers: followers,
                              gender: ['Male', 'Female', 'Others'].sample, estimated_price: followers / 1000)
  influencer.user = user
  influencer.save!
  influencers << influencer
end

# Create 5 Businesses
puts "Creating Businesses ..."
emails = ["m.kern@ingwiest.de", "hardwick.ethan@outlook.com", "yousef@gmail.com", "katiekklht@gmail.com"]
4.times do |index|
  puts "Creating Business #{index + 1} ..."
  user = User.create!(email: emails[index], password: "123456", phone_number: Faker::PhoneNumber.cell_phone_in_e164,
                      first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, location: "london", role: "Business")
  business = Business.new(company_name: Faker::Company.name)
  business.user = user
  business.save!

  # Create 1-2 Campaign for each Business
  puts "Creating Campaigns & Proposals for Business #{index + 1} ..."
  rand(2..3).times do
    date = Faker::Date.forward(days: rand(10..30))
    campaign = Campaign.new(name: Faker::Commerce.product_name, location: "London", start_date: date,
                            end_date: date + rand(15..45), description: Faker::Marketing.buzzwords, budget: Faker::Commerce.price(range: 500..1000))
    campaign.business = business
    campaign.save!

    # Create 1-3 Proposals for each Campaign
    rand(2..4).times do |i|
      proposal = Proposal.new(title: "#{campaign.name} #{i + 1}", creator: %w[Business Influencer].sample)
      proposal.campaign = campaign
      proposal.influencer = influencers.sample
      proposal.save!
    end
  end
end
