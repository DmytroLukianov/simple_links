Rails.application.routes.draw do
  devise_for :users
  root to: 'home#index'
  authenticate :user, -> (u) { u.admin? } do
    namespace :admin_section do
      resources :users, only: %i[index]
    end
  end
  authenticated :user do
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
