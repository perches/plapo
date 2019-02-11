Rails.application.routes.draw do
  # devise_for :users

  mount_devise_token_auth_for 'User', at: 'auth', controllers: { omniauth_callbacks: "users/omniauth_callbacks" }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # token auth routes available at /api/v1/auth
  # namespace :api do
  #   scope :v1 do
  #     mount_devise_token_auth_for 'User', at: 'auth', controllers: { omniauth_callbacks: "users/omniauth_callbacks" }
  #   end
  # end
end
