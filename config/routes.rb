Rails.application.routes.draw do
  root to: 'pages#index'

  resources :projects, only: %i(index create update destroy), shallow: true do
    resources :tasks, only: %i(create update destroy)
  end

end
