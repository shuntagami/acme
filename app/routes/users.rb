module Acme
  module Routes
    class UsersRoutes < Base
      namespace "/users" do
        get do
          unless current_user
            status 401
            return
          end

          status 200
          body current_user.to_json
        end
      end
    end
  end
end
