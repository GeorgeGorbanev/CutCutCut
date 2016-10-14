Rails.application.routes.draw do

  devise_for :users, controllers: { sessions: 'users/sessions' }

  root to: 'static_pages#home'

  get 'home' => "static_pages#home"

  get 'about' => "static_pages#about"

  get 'contact' => "static_pages#contact"

  get 'tools/public' => "tools#public"

  get 'tools/private' => "tools#private"

  #get 'persons/profile', as: 'user_root'

  get 'users/sign_out' => "sessions#destroy"

  get 'links/generate_anon' => "links#generate_anon"

  get '*path' => "links#redirect_user_link"


end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

