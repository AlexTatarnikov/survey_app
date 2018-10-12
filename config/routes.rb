Rails.application.routes.draw do
  root to: 'spa#index'

  get '*path', to: 'spa#index', constraints: ->(request) do
    !request.xhr? && request.format.html?
  end
end
