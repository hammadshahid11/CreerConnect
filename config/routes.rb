Rails.application.routes.draw do

  namespace :admins do
    resources :dashboard do
      collection do
        get 'user_management'
        post 'block_user'
        post 'delete_user'
        post 'unblock_user'
        
      end

      member do
          post 'approve_job_listing'
          post 'disapprove_job_listing'
      end
  

    end
  end  


  devise_for :admins, controllers: {
    sessions: 'admins/sessions',
    passwords: 'admins/passwords',
    registrations: 'admins/registrations',
    confirmations: 'admins/confirmations'
    # Add other Devise controllers here if needed
  }


  # get 'job_applications/new'
  # get 'job_applications/create'
  # get 'job_applications/show' 
  get 'home/index'
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    registrations: 'users/registrations',
    confirmations: 'users/confirmations'
  }
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  

  resources :job_applications

  
  resources :job_seekers do
    resources :saved_jobs do
      member do
       post 'save'
      end
    end
  end



  resources :company_profiles do
    resources :job_postings do
      # Custom route for viewing job applicants for a specific job posting
      get 'view_applicants', to: 'job_postings#view_applicants'
    end
  end


  get 'job_postings/display', to: 'job_postings#display', as: 'display'
  get 'job_postings/search', to: 'job_postings#search', as: 'job_search'
  root 'home#index'



end
