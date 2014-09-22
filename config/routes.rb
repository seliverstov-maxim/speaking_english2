Rails.application.routes.draw do
  scope module: :web do
    root 'welcome#index'

    resource :welcome, only: [:show]
    resources :lessons, only: [:index, :show]

    namespace :admin do
      root 'lessons#index'

      resources :films, only: [:index, :edit, :new, :create, :update, :destroy]
      resources :tags, only: [:index, :edit, :new, :create, :update, :destroy]
      resources :langs, only: [:index, :edit, :new, :create, :update, :destroy]
      resources :film_slices, only: [:index, :edit, :new, :create, :update, :destroy]
      resources :video_files, only: [:index, :edit, :new, :create, :update, :destroy]
      resources :sub_files, only: [:index, :edit, :new, :create, :update, :destroy]
      resources :lessons, only: [:index, :edit, :new, :create, :update, :destroy]
    end
  end
end
