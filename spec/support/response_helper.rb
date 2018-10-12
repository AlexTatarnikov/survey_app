module ResponseHelper
  def parsed_body
    response = JSON.parse(response_body)

    if response.is_a?(Array)
      response.map(&:deep_symbolize_keys)
    else
      response.deep_symbolize_keys
    end
  end
end
