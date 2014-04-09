VCR.configure do |config|
  config.hook_into :faraday
  config.cassette_library_dir = 'spec/fixtures/vcr_cassettes'
  config.configure_rspec_metadata!
  config.preserve_exact_body_bytes { true }

  config.default_cassette_options = {
    re_record_interval: 2592000 # 1.month
  }

  config.before_record do |env|
    env.response.headers.delete('set-cookie')
    env.request.headers.delete('Authorization')
  end
end
