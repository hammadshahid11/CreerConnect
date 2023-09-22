Rails.application.routes.draw do
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
  
  resources :job_seekers do
    resources :saved_jobs
  end

  resources :company_profiles do
    resources :job_postings
  end


  get 'job_postings/display', to: 'job_postings#display', as: 'display'
  get 'job_postings/search', to: 'job_postings#search', as: 'job_search'
  root 'home#index'



end
