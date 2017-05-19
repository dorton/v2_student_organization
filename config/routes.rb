Rails.application.routes.draw do



  post 'groups/:group_id/students/:student_id/update', to: 'days#add_student_to_group', as: 'add_student_to_group'
  post 'groups/:group_id/students/:student_id/remove', to: 'days#remove_student_from_group', as: 'remove_student_from_group'

  post 'days/:day_id/slack', to: 'days#slack_post', as: 'slack'


  get 'dashboard/index'

  resources :cities do
    resources :users
    resources :campus_areas
  end




  resources :cohorts do
    resources :students do
      collection {post :import}
    end
    resources :days do
      resources :groups
    end
  end


  root 'dashboard#index'



  devise_for :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
