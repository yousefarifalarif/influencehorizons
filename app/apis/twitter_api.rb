require 'json'
require 'typhoeus'
require 'oauth'

class TwitterApi
  def twitter_api(username)
    user_name = username
    user_lookup_url = "https://api.twitter.com/2/users/by/username/#{user_name}"
    bearer_token = ENV["BEARER_TOKEN"]
    params = {
      "expansions": "pinned_tweet_id",
      "tweet.fields": "attachments,author_id,conversation_id,created_at,entities,geo,id,in_reply_to_user_id,lang",
      "user.fields": "public_metrics"
      # "media.fields": "url",
      # "place.fields": "country_code",
      # "poll.fields": "options"
    }

    response = user_lookup(user_lookup_url, bearer_token, params)
    json_reponse = JSON.parse(response.body)["data"]["public_metrics"]["followers_count"]
  end

  def user_lookup(url, bearer_token, params)
    options = {
      method: 'get',
      headers: {
        "User-Agent": "test-lookup",
        "Authorization": "Bearer AAAAAAAAAAAAAAAAAAAAAF83WQEAAAAAp%2FKDtTvrJZ%2BolEDKS8ZjAfJWUvw%3DoihXeUN7PiXUM3GRLm7MnSZPg45upt7913n04u6K88aTXpYvuE"
      },
      params: params
    }
    request = Typhoeus::Request.new(url, options)
    response = request.run
    return response
  end
end
