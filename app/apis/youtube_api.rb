class YoutubeApi
require 'google/apis'
require 'google/apis/youtube_v3'
require 'googleauth'
require 'googleauth/stores/file_token_store'

require 'fileutils'
require 'json'

# REPLACE WITH VALID REDIRECT_URI FOR YOUR CLIENT
REDIRECT_URI = 'http://localhost'
APPLICATION_NAME = 'YouTube Data API Ruby Tests'

# REPLACE WITH NAME/LOCATION OF YOUR client_secrets.json FILE
CLIENT_SECRETS_PATH = 'client_secret.json'

# REPLACE FINAL ARGUMENT WITH FILE WHERE CREDENTIALS WILL BE STORED
CREDENTIALS_PATH = File.join(ENV[YOUTUBE_TOKEN])

# SCOPE FOR WHICH THIS SCRIPT REQUESTS AUTHORIZATION
SCOPE = Google::Apis::YoutubeV3::AUTH_YOUTUBE_READONLY


# Initialize the API
service = Google::Apis::YoutubeV3::YouTubeService.new
service.client_options.application_name = APPLICATION_NAME
service.authorization = authorize

# Sample ruby code for channels.list

def channels_list_by_username(service, part, **params)
  response = service.list_channels(part, params).to_json
  item = JSON.parse(response).fetch("items")[0]

  puts ("This channel's ID is #{item.fetch("id")}. " +
        "Its title is '#{item.fetch("snippet").fetch("title")}', and it has " +
        "#{item.fetch("statistics").fetch("viewCount")} views.")
end

channels_list_by_username(service, 'snippet,contentDetails,statistics', for_username: 'GoogleDevelopers')
end
