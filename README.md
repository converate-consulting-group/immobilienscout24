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
immoscout_client = Immobilienscout24.client(token: 'your_oauth_token', token_secret: 'your_oauth_token_secret')
immoscout_client.real_estates
```

For the oauth process you can use the excellent [omniauth-immobilienscout24][oauthgem] gem.

[oauthgem]: https://github.com/endil/omniauth-immobilienscout24


### Consuming resources

Most methods return a `Resource` object which provides dot notation and `[]` access for fields returned in the API response.

```ruby
# Fetch the real estates
real_estates = immoscout_client.real_estates

# Sorry, we haven't invented the Immobilienscout24 response...
real_estates = real_estates["realestates.realEstates"].realEstateList.realEstateElement

# Iterate over results
real_estates.each do |real_estate|
  puts real_estate.title
  # etc.
end
```

### Creating / Updating resources

The creation / modification of resources follows a simple rule: If you make JSON requests then the object that you send via the api has to respond to `.to_json`. If you make XML requests then it has to respond to `.to_xml`.

```ruby
# Wrapper class for our request
class ImmoscoutEstate

  def to_json
    # generates the json for
    # the real estate that you want to create / update
  end

end

immoscout_estate = ImmoscoutEstate.new
immoscout_client.create_real_estate(immoscout_estate) # `.to_json` will be called on the immoscout_estate object
```

### Configuration

For a basic configuration you just enter your `consumer_key` and `consumer_secret`.

```ruby
Immobilienscout24.configure do |config|
  config.consumer_key = 'your_consumer_key'
  config.consumer_secret = 'your_consumer_secret'
end

# If you want to use the sandbox
config.sandbox = true

# If you want to generate a log file
config.faraday_logger = [:logger, Logger.new('log/immobilienscout24.log')]

# There are more advanced configuration options. Take a look at `Immobilienscout24::Configuration`.
```

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


