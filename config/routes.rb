Rails.application.routes.draw do
  resources :busker_profiles
  resources :events
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "pages#home"
  get '/success', to: "payments#success", as: "payment_success"
  post '/payments/webhook', to: "payments#webhook", as: "webhook"
  post '/payments', to: "payments#create_payment_intent", as: "create_payment_intent"

  get '/reviews/new/:busker_profile_id', to: 'reviews#new', as: "create_new_review"   
  post '/reviews', to: 'reviews#create'
  delete '/reviews/:id/:busker_profile_id', to: 'reviews#destroy', as: "delete_review"
  get '/reviews/:id/:busker_profile_id/edit', to: 'reviews#edit', as: "edit_review"
  patch '/reviews/:id', to: 'reviews#update'
  put '/reviews/:id', to: 'reviews#update'
  get '/reviews/:id', to: 'reviews#show', as: 'review'
end
