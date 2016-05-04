Rails.application.routes.draw do
  root 'pages#home'

  #users_controller
  devise_for :users
  resources :user
  resources :authentications
  get '/auth/:provider/callback' => 'authentications#create'

  #jobs_controller
  get '/jobs/search' => 'jobs#search', as: :job_search
  get '/jobs/:id' => 'jobs#show', as: :job
  get '/users/:user_id/jobs' => 'jobs#index', as: :user_jobs

  #job_details_controller
  post '/users/:user_id/job_details' => 'job_details#create', as: :user_job_details
  patch '/users/:user_id/job_details/:job_detail_id' => 'job_details#update', as: :user_job_detail  
end
