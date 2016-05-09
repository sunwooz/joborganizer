Rails.application.routes.draw do
  root 'pages#home'

  #users_controller
  devise_for :users
  resources :user
  resources :authentications
  get '/auth/:provider/callback' => 'authentications#create'

  #jobs_controller -> should rename this to indeed
  get '/jobs/search' => 'jobs#search', as: :job_search
  get '/jobs/:jobkey' => 'jobs#show', as: :job

  #job_details_controller
  post '/users/:user_id/job_details' => 'job_details#create', as: :user_job_details
  patch '/users/:user_id/job_details/:job_detail_id' => 'job_details#update', as: :user_job_detail
  get '/users/:user_id/jobs' => 'job_details#index', as: :user_job_details_index
end
