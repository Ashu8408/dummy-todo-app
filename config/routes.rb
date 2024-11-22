Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # get "/index",     to: "root#index"
  get "/contact",   to: "root#contact"
  get "/about",     to: "root#about"

  get "/jsonresponse",     to: "root#api"
  get "user/:id/:name",  to: "root#user"
  post "/add",      to: "root#add"

  get "/delete/:id", to: "root#delete"

  get "/search", to: "root#search"
  root "root#index"
  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # root "posts#index"
end
