Rails.application.routes.draw do

  resources :pages do
    member do
      get :delete
    end
  end

  resources :subjects do
    member do
      get :delete
    end
  end

end
