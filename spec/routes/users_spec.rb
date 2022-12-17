describe Acme::Routes::UsersRoutes do
  let(:user1) { User.find_or_create_by(name: "shuntagami", access_token: "secure_access_token_1") }

  describe "GET /users" do
    it "returns a specific user if access_token is correct" do
      get "/users", nil, { "HTTP_ACCESS_TOKEN" => user1.access_token }

      assert_schema_conform(200)
    end

    it "returns a status code of 401 if access_token is not correct" do
      get "/users", nil, { "HTTP_ACCESS_TOKEN" => "not correct" }

      assert_schema_conform(401)
    end
  end
end
