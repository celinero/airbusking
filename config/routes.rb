Rails.application.routes.draw do
  resources :busker_profiles
  resources :events
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "pages#home"
  get '/success', to: "payments#success", as: "payment_success"
  post '/payments/webhook', to: "payments#webhook", as: "webhook"
  post '/payments', to: "payments#create_payment_intent", as: "create_payment_intent"
end
