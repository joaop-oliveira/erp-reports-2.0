Rails.application.routes.draw do
  # namespace :api do
  #   namespace :v1 do
  #     resources :bancos do
  #     end
  #   end
  # end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/banco', to: 'banco#index'
end
