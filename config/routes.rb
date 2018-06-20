Rails.application.routes.draw do

    namespace :v1, defaults: { format: :json } do
      # v1/providers
      resources :providers, only: [:index, :create, :show, :destroy]
    end

  end
