# Immobilienscout24

A Ruby wrapper for the Immobilienscout24 REST API. This wrapper has all the important parts to create and maintain the real estate of a broker on Immobilienscout24.

*Warning: This gem is not complete. There are still some parts of the Immobilienscout24 that we haven't had the time to implement. We will extend the functionallity as soon as we have more time. In the spirit of free software, everyone is encouraged to help improve this project.*

## Quick start

Add this line to your application's Gemfile:

    gem 'immobilienscout24'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install immobilienscout24

API methods are available from the `Immobilienscout24.client`.

```ruby
# Provide authentication credentials

Immobilienscout24.configure do |config|
  config.consumer_key = 'your_consumer_key'
  config.consumer_secret = 'your_consumer_secret'
end

# Fetch your real estates
client = Immobilienscout24.client(token: 'your_oauth_token', token_secret: 'your_oauth_token_secret')
client.real_estates
```

For the oauth process you can use the excellent [omniauth-immobilienscout24][oauthgem] gem.

[oauthgem]: https://github.com/endil/omniauth-immobilienscout24


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## TODO

* Extend API
* Write more tests
* Extend README
* Write wiki about multi-tanent management


