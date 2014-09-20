Rails.application.routes.draw do
  scope module: :web do
    root 'welcome#index'

    namespace :admin do
      root 'welcome#index'

      resources :films, only: [:index, :edit, :new, :create, :update, :destroy]
      resources :tags, only: [:index, :edit, :new, :create, :update, :destroy]
      resources :langs, only: [:index, :edit, :new, :create, :update, :destroy]
      resources :film_slices, only: [:index, :edit, :new, :create, :update, :destroy]
    end
  end
end
