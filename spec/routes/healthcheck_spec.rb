describe Acme::Routes::Healthcheck do
  describe 'GET /_healthcheck' do
    it 'is ok' do
      get '/_healthcheck'
      assert_schema_conform(200)
    end
  end
end
