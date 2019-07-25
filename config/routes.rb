Rails.application.routes.draw do

  root 'demo#hello'

  resources :subjects do
    member do
      get :delete
    end
  end

end
