Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      namespace :users do
        post 'tokens' => 'tokens#create'
        post 'registrations' => 'registrations#create'

        resources :surveys, only: [] do
          resource :response, only: [:create, :show]
        end
      end

      resources :surveys, only: [:index, :show]
    end
  end

  get '*path', to: 'spa#index', constraints: ->(request) do
    !request.xhr? && request.format.html?
  end

  root to: 'spa#index'
end
