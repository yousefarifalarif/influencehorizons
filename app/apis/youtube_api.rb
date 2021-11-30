require 'uri'
require 'net/http'
require 'openssl'
require 'open-uri'
require 'nokogiri'

class YoutubeApi

  def youtube_api(channelname)
    channel_name = channelname
    url = URI("https://scrapingbee.p.rapidapi.com/?url=https%3A%2F%2Fwww.youtube.com%2F#{channel_name}%2Fabout&render_js=true")

    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE

    request = Net::HTTP::Get.new(url)
    request["x-rapidapi-host"] = 'scrapingbee.p.rapidapi.com'
    request["x-rapidapi-key"] = '790ad7b274mshe2d4b13b77d1305p1d5c15jsncfc1190599eb'

    response = http.request(request)
    nokogiri_translate(response.read_body)
  end

  def nokogiri_translate(html_file)
    html_doc = Nokogiri::HTML(html_file)
    subscriber_count = 0
    html_doc.search('#subscriber-count').each do |element|
      subscriber_count = element.text.strip.split[0]
    end
    convert_subscriber_count(subscriber_count)
  end

  def convert_subscriber_count(subscriber_count)
    subscriber_metric = subscriber_count.chars.last
    subscriber_count = subscriber_count.to_i
    subscriber_metric.downcase == "k" ? subscriber_count *= 1000 : subscriber_count *= 100_000
  end

end
