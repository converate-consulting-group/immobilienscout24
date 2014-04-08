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
    let(:token) { '619033e3-9fc0-4f3a-a0fe-58da8d4582d7' }
    let(:token_secret) { 'XB5QRN1pjaWRrS+Aq+WhGS61Lr/WYayaMtF6uud24QRFUYzouuvb59Spk9YK31p3ZO1gXFN1AUrWTJQcZ+FngVo/2PcWPE//AQPmClvP5VM=' }
    let(:client) { Immobilienscout24.client(token: token, token_secret: token_secret) }
  end

end
