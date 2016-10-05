Rails.application.routes.draw do

  devise_for :users, controllers: { sessions: 'users/sessions' }

  root to: 'static_pages#home'

  get 'home' => "static_pages#home"

  get 'about' => "static_pages#about"

  get 'contact' => "static_pages#contact"

  get 'persons/profile', as: 'user_root'

  get 'tools/public'

  get 'tools/private'

  get 'sign/signup'

  get 'sign/signin'

  get 'users/sign_out' => "sessions#destroy"

end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

