class SpaController < ActionController::Base
  layout 'spa'

  protect_from_forgery with: :exception

  def index
  end
end
