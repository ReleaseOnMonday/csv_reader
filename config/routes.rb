Rails.application.routes.draw do
  resources :people

  root "people#index"

  #resources :people do
  post "people/import"
  #end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
