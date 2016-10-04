Rails.application.routes.draw do
  get 'sign/signup'

  get 'sign/signin'

  root to: 'static_pages#home'

  get 'home' => "static_pages#home"

  get 'about' => "static_pages#about"

  get 'contact' => "static_pages#contact"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
