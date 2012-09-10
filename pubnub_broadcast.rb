require 'Pubnub'
require 'configuration'
require_relative 'config/pubnub_config'

config = Configuration.for('messaging_with_pubnub')

publish_key = config.pn_publish_key  
subscribe_key = config.pn_subscribe_key 
secret_key = config.pn_secret_key  
cipher_key = config.pn_cipher_key
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

