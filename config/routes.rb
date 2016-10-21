Rails.application.routes.draw do

  devise_for :users, controllers: { sessions: 'users/sessions' }

  root to: 'static_pages#home'

  get 'about' => "static_pages#about"

  get 'contact' => "static_pages#contact"

  get 'links' => "links#index"

  get 'links/new' => "links#new"

  get 'links/search' => "links#index"

  get 'users/sign_out' => "sessions#destroy"

  get 'links/generate_anon' => "links#generate_anon"

  get 'links/public_search' => "links#public_search"

  get 'links/:link_id' => "links#link_info"

  get '*path' => "links#redirect_user_link"


end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

