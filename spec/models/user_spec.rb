describe User, type: :model do
  describe "validation" do
    let(:user) { User.new(name: "a" * 20, access_token: SecureRandom.uuid) }

    it "is valid if data is valid" do
      expect(user).to be_valid
    end

    it "is invalid if name is nil" do
      user.name = nil
      expect(user).to_not be_valid
      expect(user.errors[:name]).to include("を入力してください")
    end

    it "is invalid if name is too long" do
      user.name = "a" * 21
      expect(user).to_not be_valid
      expect(user.errors[:name]).to include("は20文字以内で入力してください")
    end

    it "is invalid if access_token is duplicated" do
      User.create(name: "hoge", access_token: "token")
      user2 = User.create(name: "fuga", access_token: "token")
      expect(user2).to_not be_valid
      expect(user2.errors[:access_token]).to include("はすでに存在します")
    end
  end
end
