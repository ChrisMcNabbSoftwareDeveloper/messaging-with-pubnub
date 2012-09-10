require 'Pubnub'
require 'configuration'
require_relative 'config/pubnub_config'

config = Configuration.for('messaging_with_pubnub')

publish_key = config.pn_publish_key  
subscribe_key = config.pn_subscribe_key 
secret_key = config.pn_secret_key  
cipher_key = config.pn_cipher_key
ssl_on = false

pubnub = Pubnub.new( publish_key, subscribe_key, secret_key, cipher_key, ssl_on )

puts Time.new

pubnub.subscribe({
                   'channel'  => 'ctm_devlink_channel',
                   'callback' => lambda do |message|
                     puts(message)    ## get and print message
                     return true      ## keep listening?
                   end
                 })

puts Time.new

