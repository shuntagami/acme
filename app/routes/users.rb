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

        put do
          unless current_user
            status 401
            return
          end

          unless current_user.update(name: params[:name])
            h = { msg: current_user.errors.full_messages.join(",") }

            status 400
            body h.to_json
            return
          end

          status 204
        end
      end
    end
  end
end
