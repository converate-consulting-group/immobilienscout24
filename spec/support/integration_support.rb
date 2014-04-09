module IntegrationSupport

  def default_config
    before do
      Immobilienscout24.configure do |config|
        config.sandbox = true
        config.disable_logging = true
      end
    end
  end

  def default_client
    # generated in playground
    let(:auth) {  YAML::load_file(File.join(File.dirname(File.expand_path(__FILE__)), 'auth.yml')) }

    let(:token) { auth["token"] }
    let(:token_secret) { auth["token_secret"] }
    let(:consumer) { Hash[consumer_key: auth["consumer_key"], consumer_secret: auth["consumer_secret"]] }

    let!(:client) { Immobilienscout24.client(consumer: consumer, token: token, token_secret: token_secret) }
  end

end
