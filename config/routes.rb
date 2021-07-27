Rails.application.routes.draw do

  root "people#index"

  resources :people do
    collection do
      post :import
      put :update_multiple
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
