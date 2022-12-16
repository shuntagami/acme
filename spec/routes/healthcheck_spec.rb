describe Acme::Routes::Healthcheck do
  describe 'GET /_healthcheck' do
    it 'is ok' do
      get '/_healthcheck'
      expect(last_response).to be_ok
    end
  end
end
