Rails.application.routes.draw do
  # resources :reviews
  resources :busker_profiles
  resources :events
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "pages#home"
  get '/success', to: "payments#success", as: "payment_success"
  post '/payments/webhook', to: "payments#webhook", as: "webhook"
  post '/payments', to: "payments#create_payment_intent", as: "create_payment_intent"

  get '/reviews/new/:busker_profile_id', to: 'reviews#new', as: "create_new_review"   
  
  
#   Prefix Verb   URI Pattern                                  Controller#Action

#           POST   /reviews(.:format)                           reviews#create
# new_review GET    /reviews/new(.:format)                      reviews#new
# edit_review GET    /reviews/:id/edit(.:format)                reviews#edit
#    review GET    /reviews/:id(.:format)                       reviews#show
#           PATCH  /reviews/:id(.:format)                       reviews#update
#           PUT    /reviews/:id(.:format)                       reviews#update
#           DELETE /reviews/:id(.:format)                       reviews#destroy







end
