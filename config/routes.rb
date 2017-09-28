Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :exercises, only: [:show, :create, :update] do
        collection do
          get 'progress'
        end
      end
    end
  end
end
