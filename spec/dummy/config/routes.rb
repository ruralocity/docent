Rails.application.routes.draw do

  resources :posts


  mount Docent::Engine => "/docent"

  root to: 'posts#index'
end
