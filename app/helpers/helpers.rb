module Acme
  module Helpers
    def current_user = User.find_by(access_token: request.get_header("HTTP_ACCESS_TOKEN"))

    def params
      @params ||= JSON.parse(request.body.read, symbolize_names: true)
    end
  end
end
