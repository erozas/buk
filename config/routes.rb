Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # If current_user is admin mount Avo routes
  authenticate :user, lambda { |u| u.admin? } do
    mount Avo::Engine, at: Avo.configuration.root_path
  end

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  get 'about-us', to: 'static#about_us', as: :about_us
  get 'faq', to: 'static#faq', as: :faq
  get 'customers', to: 'static#customers', as: :customers

  get '/rss', to: 'static#rss', as: :rss
  get 'sitemap.xml', to: redirect('https://s3.amazonaws.com/tutorials-public-avo/sitemap.xml')
  get 'dynamic-sitemap.xml', to: 'sitemap#index', as: :dynamic_sitemap

  resources :articles, only: [:index, :show]
  resources :authors, only: [:show]
  resource :oauth_connections, only: [:create]
  resource :profile, only: [:show]
  resources :books, only: [:index, :show, :new, :create, :edit, :update] do
    resources :reviews, only: [:new, :create]
  end
  resources :users, only: [:show]

  # Blog routes
  get 'blog', to: 'articles#index', as: :blog
  get 'blog/:id', to: 'articles#show', as: :blog_post

  # Defines the root path route ("/")
  root "static#home"
end
