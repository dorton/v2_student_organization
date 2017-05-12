Rails.application.routes.draw do


  post 'groups/:group_id/students/:student_id/update', to: 'days#add_student_to_group', as: 'add_student_to_group'

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
