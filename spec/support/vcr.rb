VCR.configure do |config|
  config.hook_into :faraday
  config.cassette_library_dir = 'spec/fixtures/vcr_cassettes'
  config.configure_rspec_metadata!

  config.default_cassette_options = {
    serialize_with: :json,
    preserve_exact_body_bytes: true,
    decode_compressed_response: true,
    record: :once
  }

  config.before_record do |env|
    env.response.headers.delete('set-cookie')
    env.request.headers.delete('Authorization')
  end
end
