Rails.application.routes.draw do

  resources :posts


  mount Docent::Engine => "/docent"
end
