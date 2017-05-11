Rails.application.routes.draw do



  get 'dashboard/index'

  resources :cities



  resources :cohorts do
    resources :days do
      resources :groups
    end
  end


  root 'dashboard#index'



  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
