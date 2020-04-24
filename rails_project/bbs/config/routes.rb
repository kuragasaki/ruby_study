Rails.application.routes.draw do
  post '/contacts/send', to:"contacts#send_message"
  get '/contacts', to:"contacts#top", as:"contacts"
  post '/tweets/create', to:'tweets#create'
  get '/tweets', to:'tweets#new', as:'new_tweet'
  #get 'static_pages/top'
  root 'static_pages#top'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
