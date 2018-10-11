require 'apitome'

RspecApiDocumentation.configure do |config|
  config.docs_dir = Rails.root.join('doc', 'api')
  config.request_headers_to_include = %w(Accept Authorization Content-Type)

  config.format = :json
end
