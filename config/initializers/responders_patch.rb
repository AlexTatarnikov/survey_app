module ActionController
  class Responder
    protected

    # This is the common behavior for formats associated with APIs, such as :xml and :json.
    def api_behavior
      raise MissingRenderer.new(format) unless has_renderer?

      if post?
        display resource, :status => :created
      else
        display resource
      end
    end
  end
end
