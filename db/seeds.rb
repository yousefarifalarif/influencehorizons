# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
require "open-uri"

User.destroy_all

influencer_avatars = [
  "https://images.unsplash.com/photo-1605405748313-a416a1b84491?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=900&ixid=MnwxfDB8MXxyYW5kb218MHx8cG9ydHJhaXR8fHx8fHwxNjM3ODQ3MTgw&ixlib=rb-1.2.1&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=1600",
  "https://images.unsplash.com/photo-1570158268183-d296b2892211?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=900&ixid=MnwxfDB8MXxyYW5kb218MHx8ZmFjZXx8fHx8fDE2Mzc4NDcyNTk&ixlib=rb-1.2.1&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=1600",
  "https://images.unsplash.com/photo-1578489758854-f134a358f08b?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=900&ixid=MnwxfDB8MXxyYW5kb218MHx8ZmFjZXx8fHx8fDE2Mzc4NDcyMjQ&ixlib=rb-1.2.1&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=1600",
  "https://images.unsplash.com/photo-1534399315465-2b91232de345?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=900&ixid=MnwxfDB8MXxyYW5kb218MHx8cG9ydHJhaXR8fHx8fHwxNjM3ODY0NzE0&ixlib=rb-1.2.1&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=1600",
  "https://images.unsplash.com/flagged/photo-1595514191830-3e96a518989b?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=900&ixid=MnwxfDB8MXxyYW5kb218MHx8cG9ydHJhaXR8fHx8fHwxNjM3ODY0NzIx&ixlib=rb-1.2.1&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=1600",
  "https://images.unsplash.com/photo-1489424731084-a5d8b219a5bb?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=900&ixid=MnwxfDB8MXxyYW5kb218MHx8cG9ydHJhaXR8fHx8fHwxNjM3ODY0OTg3&ixlib=rb-1.2.1&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=1600",
  "https://images.unsplash.com/photo-1496345875659-11f7dd282d1d?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=900&ixid=MnwxfDB8MXxyYW5kb218MHx8cG9ydHJhaXR8fHx8fHwxNjM3ODY1MDE5&ixlib=rb-1.2.1&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=1600",
  "https://images.unsplash.com/photo-1554151228-14d9def656e4?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=900&ixid=MnwxfDB8MXxyYW5kb218MHx8cG9ydHJhaXR8fHx8fHwxNjM3ODY1MDA2&ixlib=rb-1.2.1&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=1600",
  "https://images.unsplash.com/photo-1543357530-d91dab30fa97?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=900&ixid=MnwxfDB8MXxyYW5kb218MHx8cG9ydHJhaXR8fHx8fHwxNjM3ODY1MDE2&ixlib=rb-1.2.1&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=1600",
  "https://images.unsplash.com/photo-1514846326710-096e4a8035e0?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=900&ixid=MnwxfDB8MXxyYW5kb218MHx8cG9ydHJhaXR8fHx8fHwxNjM3ODY1MDU1&ixlib=rb-1.2.1&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=1600",
  "https://images.unsplash.com/photo-1607503873903-c5e95f80d7b9?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=900&ixid=MnwxfDB8MXxyYW5kb218MHx8cG9ydHJhaXR8fHx8fHwxNjM3ODY1MDY2&ixlib=rb-1.2.1&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=1600"
]
statuses = ["Pending", "In Progress", "Completed"]
booleans = [true, false]
tasks = ["Do a live feed for", "Design a poster for", "Design a banner for", "Take a photo for",
         "Make a video for", "Create a contest for"]
influencers = []

# Create 10 Influencers
puts "Creating Influencers ..."
11.times do |index|
  user = User.create!(email: Faker::Internet.email, password: "123456", phone_number: Faker::PhoneNumber.cell_phone_in_e164,
                      first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, location: "London", role: "Influencer")
  username = Faker::Twitter.screen_name
  followers = rand(1000..200_000)
  influencer = Influencer.new(ig_username: username, ig_followers: followers,
                              youtube_channel_name: username, youtube_subscribers: followers,
                              twitter_username: username, twitter_followers: followers,
                              facebook_username: username, facebook_followers: followers,
                              gender: ['Male', 'Female'].sample, estimated_price: followers / 1000)
  file = URI.open(influencer_avatars[index])
  influencer.photo.attach(io: file, filename: "#{username}.png", content_type: 'image/png')
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
  business = Business.new(company_name: Faker::Company.name, company_url: Faker::Internet.url, industry: Faker::Company.industry)
  url = Faker::Company.logo
  file = URI.open(url)
  business.photo.attach(io: file, filename: "#{business.company_name}.png", content_type: 'image/png')
  business.user = user
  business.save!

  # Create 1-2 Campaign for each Business
  puts "Creating Campaigns & Proposals for Business #{index + 1} ..."
  rand(2..3).times do
    date = Faker::Date.forward(days: rand(10..30))
    campaign = Campaign.new(name: Faker::Commerce.product_name, location: "London", start_date: date,
                            end_date: date + rand(15..45), description: Faker::Marketing.buzzwords, budget: Faker::Commerce.price(range: 500..1000))
    campaign.archived = index.zero? ? true : booleans.sample
    campaign.business = business
    campaign.save!

    # Create 1-3 Proposals for each Campaign
    rand(2..4).times do
      if campaign.archived
        proposal = Proposal.new(title: "#{tasks.sample} #{campaign.name}", creator: "Business", status: "Completed")
      else
        proposal = Proposal.new(title: "#{tasks.sample} #{campaign.name}", creator: %w[Business Influencer].sample)
        proposal.status = proposal.creator == "Influencer" ? "Pending" : statuses.sample
      end
      proposal.accepted = proposal.status != "Pending"
      proposal.campaign = campaign
      proposal.influencer = influencers.sample
      proposal.save!

      chatroom = Chatroom.create!(name: proposal.title, proposal:proposal)
    end
  end
end
