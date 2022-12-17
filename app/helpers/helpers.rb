module Acme
  module Helpers
    def current_user = User.find_by(access_token: request.get_header("HTTP_ACCESS_TOKEN"))
  end
end
