Rails.application.routes.draw do
  devise_for :users
  root to: 'links#index'
  authenticate :user, -> (u) { u.admin? } do
    mount RailsAdmin::Engine => '/admin_section', as: 'rails_admin'
  end
  authenticated :user do
    resources :links
    get 'my_links', to: 'links#my'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
