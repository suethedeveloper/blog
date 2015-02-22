Rails.application.routes.draw do

  root 'writers#index'

  resources :writers do
   resources :posts, shallow: true
  end 

end
