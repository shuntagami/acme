describe Acme::Routes::UsersRoutes do
  let(:user1) { User.create(name: "shuntagami", access_token: SecureRandom.uuid) }

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

  describe "PUT /users" do
    subject { put "/users", params, { "HTTP_ACCESS_TOKEN" => user1.access_token } }

    context "when request is valid" do
      let(:params) { { name: "updated name" } }

      it "returns a empty reponse if success" do
        expect { subject }.to change { user1.reload.name }.from("shuntagami").to("updated name")
        assert_schema_conform(204)
      end
    end

    context "when request is invalid" do
      let(:params) { { name: "longlonglonglonglonglonglonglonglonglonglonglonglonglonglonglong" } }

      it "returns a status code of 400" do
        expect { subject }.to_not change { user1.reload.name }
        assert_schema_conform(400)
      end
    end
  end
end
