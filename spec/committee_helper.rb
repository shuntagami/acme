module CommitteeHelper
  def committee_options
    open_api = OpenAPIParser.parse(YAML.load_file(committee_schema_path))
    @committee_options ||= { schema: Committee::Drivers::OpenAPI3::Driver.new.parse(open_api) }
  end

  def request_object
    last_request
  end

  def response_data
    [last_response.status, last_response.headers, last_response.body]
  end

  private

  def committee_schema_path
    "docs/openapi.yaml"
  end
end
