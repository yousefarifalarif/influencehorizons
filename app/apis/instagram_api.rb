require 'uri'
require 'net/http'
require 'openssl'
require 'json'

class InstagramApi

  def instagram_api(username)

    user_name = username

    url = URI("https://instagram40.p.rapidapi.com/account-info?username=#{user_name}&wrap=0")

    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE

    request = Net::HTTP::Get.new(url)
    request["x-rapidapi-host"] = 'instagram40.p.rapidapi.com'
    request["x-rapidapi-key"] = '790ad7b274mshe2d4b13b77d1305p1d5c15jsncfc1190599eb'

    response = http.request(request)
    json_response = JSON.parse(response.read_body)["edge_followed_by"]["count"]
  end

end
