Rails.application.routes.draw do
  scope module: :web do
    root 'welcome#index'

    namespace :admin do
      root 'welcome#index'

      resources :films, only: [:index, :edit, :new, :create, :update, :destroy]
    end
  end
end
