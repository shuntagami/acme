module Acme
  module Routes
    class UsersRoutes < Base
      namespace "/users" do
        get do
          user = User.find_by(access_token: request.get_header("X_ACCESS_TOKEN"))

          unless user
            status 401
            return
          end

          status 200
          body user.to_json
        end
      end
    end
  end
end
