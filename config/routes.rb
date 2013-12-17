SocialThing::Application.routes.draw do
  resources :users
  resource :session
  resource :password_reset, :only  => [:new, :create, :edit, :update]

end
