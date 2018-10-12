class Api::V1::BaseController < ApplicationController
  private

  def respond_with_error(object, options={})
    render({json: { errors: object.errors.to_h }, status: 422}.merge(options))
  end
end
