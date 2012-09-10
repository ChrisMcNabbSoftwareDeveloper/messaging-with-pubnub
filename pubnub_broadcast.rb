require 'Pubnub'

publish_key = "pub-91cb1068-b33c-4a39-9ba5-0b0097dc78e8"
subscribe_key = "sub-6dea4ed9-f1f9-11e1-ad37-39ead1f66571"
secret_key = "sec-YTkzMjJlOTctMDQxNS00ZDEyLTkyMDItOWMyOWVlNjM5MjVm"
cipher_key = ""
ssl_on = false

ARGV.each do|a|
  puts "Argument: #{a}"
  @p = a
end

pubnub = Pubnub.new( publish_key, subscribe_key, secret_key, cipher_key, ssl_on )
pubnub.publish({
                 'channel' => 'ctm_devlink_channel',
                 'message' => "#{@p}",
                 'callback' => lambda do |message|
                   puts(message)
                 end
               })

