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

female_influencer_avatars = [
  "https://images.unsplash.com/photo-1605405748313-a416a1b84491?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=900&ixid=MnwxfDB8MXxyYW5kb218MHx8cG9ydHJhaXR8fHx8fHwxNjM3ODQ3MTgw&ixlib=rb-1.2.1&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=1600",
  "https://images.unsplash.com/photo-1578489758854-f134a358f08b?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=900&ixid=MnwxfDB8MXxyYW5kb218MHx8ZmFjZXx8fHx8fDE2Mzc4NDcyMjQ&ixlib=rb-1.2.1&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=1600",
  "https://images.unsplash.com/photo-1514846326710-096e4a8035e0?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=900&ixid=MnwxfDB8MXxyYW5kb218MHx8cG9ydHJhaXR8fHx8fHwxNjM3ODY1MDU1&ixlib=rb-1.2.1&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=1600",
  "https://images.unsplash.com/photo-1607503873903-c5e95f80d7b9?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=900&ixid=MnwxfDB8MXxyYW5kb218MHx8cG9ydHJhaXR8fHx8fHwxNjM3ODY1MDY2&ixlib=rb-1.2.1&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=1600"
]

male_influencer_avatars = [
  "https://images.unsplash.com/photo-1570158268183-d296b2892211?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=900&ixid=MnwxfDB8MXxyYW5kb218MHx8ZmFjZXx8fHx8fDE2Mzc4NDcyNTk&ixlib=rb-1.2.1&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=1600",
  "https://images.unsplash.com/photo-1534399315465-2b91232de345?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=900&ixid=MnwxfDB8MXxyYW5kb218MHx8cG9ydHJhaXR8fHx8fHwxNjM3ODY0NzE0&ixlib=rb-1.2.1&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=1600",
  "https://images.unsplash.com/flagged/photo-1595514191830-3e96a518989b?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=900&ixid=MnwxfDB8MXxyYW5kb218MHx8cG9ydHJhaXR8fHx8fHwxNjM3ODY0NzIx&ixlib=rb-1.2.1&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=1600",
  "https://images.unsplash.com/photo-1496345875659-11f7dd282d1d?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=900&ixid=MnwxfDB8MXxyYW5kb218MHx8cG9ydHJhaXR8fHx8fHwxNjM3ODY1MDE5&ixlib=rb-1.2.1&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=1600"

]

yousef_avatar = "https://ca.slack-edge.com/T02NE0241-U02GSM7UGAV-9448e7c7069f-512"
STATUSES = ["Pending", "In Progress", "Completed"]
BOOLEANS = [true, false]
TASKS = ["Do a live feed for", "Design a poster for", "Design a banner for", "Take a photo for",
         "Make a video for", "Create a contest for"]
INFLUENCERS = []

female_users = [{first_name: 'Kenzie', last_name: 'Jaylyn', password: "123456", phone_number: Faker::PhoneNumber.cell_phone_in_e164, location: "London", role: "Influencer"},
              {first_name: 'Paulene', last_name: 'Jewel', password: "123456", phone_number: Faker::PhoneNumber.cell_phone_in_e164, location: "London", role: "Influencer" },
              {first_name: 'Moriah', last_name: 'Wilfred', password: "123456", phone_number: Faker::PhoneNumber.cell_phone_in_e164, location: "London", role: "Influencer" },
              {first_name: 'Esther', last_name: 'Millie', password: "123456", phone_number: Faker::PhoneNumber.cell_phone_in_e164, location: "London", role: "Influencer" },]


male_users = [{first_name: 'Zac', last_name: 'Saylor', password: "123456", phone_number: Faker::PhoneNumber.cell_phone_in_e164, location: "London", role: "Influencer" },
              {first_name: 'Eben', last_name: 'Kenzie', password: "123456", phone_number: Faker::PhoneNumber.cell_phone_in_e164, location: "London", role: "Influencer" },
              {first_name: 'Noel', last_name: 'Jaylyn', password: "123456", phone_number: Faker::PhoneNumber.cell_phone_in_e164, location: "London", role: "Influencer" },
              {first_name: 'John', last_name: 'Madilyn', password: "123456", phone_number: Faker::PhoneNumber.cell_phone_in_e164, location: "London", role: "Influencer" }]

demo_influencers = {first_name: 'Yousef', last_name: 'Arif', password: "123456", phone_number: Faker::PhoneNumber.cell_phone_in_e164, location: "London", role: "Influencer", email: "yousef@gmail.com" }

def create_influences(users, avatars)
  users.each_with_index do |user, index|
  puts "Creating Influencer ..."
    new_user = User.create!(email: "#{user[:first_name]}.#{user[:last_name]}@gmail.com", password: "123456", phone_number: Faker::PhoneNumber.cell_phone_in_e164,
                        first_name: user[:first_name], last_name: user[:last_name], location: "London", role: "Influencer")
    username = "#{user[:first_name].chars.first}_#{user[:last_name]}"
    i_followers = rand(1500..90_000)
    t_followers = rand(i_followers * 0.5..i_followers)
    y_followers = rand(i_followers * 0.5..i_followers)
    f_followers = rand(i_followers * 0.5..i_followers)
    influencer = Influencer.new(ig_username: username, ig_followers: i_followers,
                                youtube_channel_name: username, youtube_subscribers: y_followers,
                                twitter_username: username, twitter_followers: t_followers,
                                facebook_username: username, facebook_followers: f_followers,
                                gender: index.even? ? 'She/Her' : 'He/Him', estimated_price: i_followers / 1000)
    if user[:first_name] == "Noel" || user[:first_name] == "Kenzie"
    influencer.gender = "They/Them"
    end
    file = URI.open(avatars[index])
    influencer.photo.attach(io: file, filename: "#{username}.png", content_type: 'image/png')
    influencer.user = new_user
    influencer.save!
    INFLUENCERS << influencer
  end
end


def create_yousef(demo_influencers, yousef_avatar)
  puts "Creating Yousef"
  new_user = User.create!(email: demo_influencers[:email], password: "123456", phone_number: Faker::PhoneNumber.cell_phone_in_e164,
                      first_name: demo_influencers[:first_name], last_name: demo_influencers[:last_name], location: "London", role: "Influencer")
  username = "#{demo_influencers[:first_name].chars.first}_#{demo_influencers[:last_name]}"
  i_followers = 86_031
  t_followers = rand(i_followers * 0.5..i_followers)
  y_followers = rand(i_followers * 0.5..i_followers)
  f_followers = rand(i_followers * 0.5..i_followers)
  influencer = Influencer.new(ig_username: username, ig_followers: i_followers,
                                youtube_channel_name: username, youtube_subscribers: y_followers,
                                twitter_username: username, twitter_followers: t_followers,
                                facebook_username: username, facebook_followers: f_followers,
                                gender: 'He/Him', estimated_price: i_followers / 1000)
  file = URI.open(yousef_avatar)
  influencer.photo.attach(io: file, filename: "#{username}.png", content_type: 'image/png')
  influencer.user = new_user
  influencer.save!
  influencer
end

def create_yousef_proposals(campaign, yousef, status)
  # Create pending proposal from business to yousef
      proposal = Proposal.new(title: "#{TASKS.sample} #{campaign.name}", creator: "Business")
      proposal.status = status
    proposal.accepted = proposal.status != "Pending"
    proposal.campaign = campaign
    proposal.influencer = yousef
    proposal.save!

    Chatroom.create!(name: proposal.title, proposal:proposal)
end

YOUSEF = create_yousef(demo_influencers, yousef_avatar)

# Create 4 Businesses
def create_businesses
  puts "Creating Businesses ..."
  15.times do |index|
    puts "Creating Business #{index + 1} ..."
    user = User.create!(email: Faker::Internet.email, password: "123456", phone_number: Faker::PhoneNumber.cell_phone_in_e164,
                        first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, location: "london", role: "Business")
    business = Business.new(company_name: Faker::Company.name, company_url: Faker::Internet.url, industry: Faker::Company.industry)
    url = Faker::Company.logo
    file = URI.open(url)
    business.photo.attach(io: file, filename: "#{business.company_name}.png", content_type: 'image/png')
    business.user = user
    business.save!

    # Create 1 Campaign for each Business
    puts "Creating Campaigns & Proposals for Business #{index + 1} ..."
    date = Faker::Date.forward(days: rand(10..30))
    campaign = Campaign.new(name: Faker::Commerce.product_name, location: "London", start_date: date,
                            end_date: date + rand(15..45), description: Faker::Marketing.buzzwords, budget: Faker::Commerce.price(range: 500..1000))
    campaign.archived = index.zero? ? true : BOOLEANS.sample
    campaign.business = business
    campaign.save!

    # Create 2 Proposals for each Campaign
    2.times do
      if campaign.archived
        proposal = Proposal.new(title: "#{TASKS.sample} #{campaign.name}", creator: "Business", status: "Completed")
      else
        proposal = Proposal.new(title: "#{TASKS.sample} #{campaign.name}", creator: %w[Business Influencer].sample)
        proposal.status = proposal.creator == "Influencer" ? "Pending" : STATUSES.sample
      end
      proposal.accepted = proposal.status != "Pending"
      proposal.campaign = campaign
      proposal.influencer = INFLUENCERS.sample
      proposal.save!
      Chatroom.create!(name: proposal.title, proposal:proposal)
    end
    create_yousef_proposals(campaign, YOUSEF, index.zero? ? "Pending" : "Completed")
  end
end

def create_socks_business
  user = User.create!(email: "info@theonlysocks.com", password: "123456", phone_number: Faker::PhoneNumber.cell_phone_in_e164,
                      first_name: 'Max', last_name: 'Kern', location: "london", role: "Business")
  business = Business.new(company_name: 'TheOnlySocks', company_url: 'www.theonlysocks.com', industry: 'Fashion')
  url = 'https://static.musictoday.com/store/bands/5422/product_600/Y4AMBE212.jpg'
  file = URI.open(url)
  business.photo.attach(io: file, filename: "#{business.company_name}.png", content_type: 'image/png')
  business.user = user
  business.save!

  campaign = [{ name: "Summer Sale", description: "A summer campaign aimed at selling the summer collection at the end of summer" },
              { name: "Black Friday Sale", description: "Advertise the black friday sales we have going on" },
              { name: "New sock range", description: "A campaign aimed at selling a new range of ankle socks" }]
  create_campaigns(campaign, business)
end


def create_campaigns(campaign, business)

  campaign.each_with_index do |campaign, index|
    puts "Creating Campaigns & Proposals for TheOnlySocks ..."
    date = Faker::Date.forward(days: rand(10..30))
    new_campaign = Campaign.new(name: campaign[:name], location: "London", start_date: date,
                            end_date: date + rand(15..45), description: campaign[:description], budget: Faker::Commerce.price(range: 500..1000))
    new_campaign.archived = true
    new_campaign.business = business
    new_campaign.save!

    rand(2..4).times do
      if new_campaign.archived
        proposal = Proposal.new(title: "#{TASKS.sample} #{new_campaign.name}", creator: "Business", status: "Completed")
      else
        proposal = Proposal.new(title: "#{TASKS.sample} #{new_campaign.name}", creator: %w[Business Influencer].sample)
        proposal.status = proposal.creator == "Influencer" ? "Pending" : STATUSES.sample
      end
      proposal.accepted = proposal.status != "Pending"
      proposal.campaign = new_campaign
      proposal.influencer = INFLUENCERS.sample
      proposal.save!

      Chatroom.create!(name: proposal.title, proposal:proposal)
    end
  end
end


def merge_influencers(female_influencer_avatars, male_influencer_avatars, female_users, male_users)
  influencer_avatars = []
  users =[]
  4.times do |index|
    influencer_avatars << female_influencer_avatars[index]
    users << female_users[index]
    influencer_avatars << male_influencer_avatars[index]
    users << male_users[index]
  end

  create_influences(users, influencer_avatars)
end

# Merge and create random influencers
merge_influencers(female_influencer_avatars, male_influencer_avatars, female_users, male_users)

# Create 4 businesses
create_businesses

# creating The Only Socks as a business
create_socks_business
