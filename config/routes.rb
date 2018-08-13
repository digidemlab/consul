Rails.application.routes.draw do

  if Rails.env.development? || Rails.env.staging?
    get '/sandbox' => 'sandbox#index'
    get '/sandbox/*template' => 'sandbox#show'
  end

  if !Rails.env.test? and Rails.application.secrets.delivery_method.to_sym == :letter_opener
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end

  draw :account
  draw :admin
  draw :annotation
  draw :budget
  draw :comment
  draw :community
  draw :debate
  draw :devise
  draw :direct_upload
  draw :document
  draw :graphql
  draw :guide
  draw :legislation
  draw :management
  draw :moderation
  draw :notification
  draw :officing
  draw :poll
  draw :proposal
  draw :related_content
  draw :tag
  draw :user
  draw :valuation
  draw :verification

  root 'welcome#index'
  get '/welcome', to: 'welcome#welcome'
  get '/consul.json', to: "installation#details"

  resources :stats, only: [:index]
  resources :images, only: [:destroy]
  resources :documents, only: [:destroy]
  resources :follows, only: [:create, :destroy]

  # More info pages
  get 'help',             to: 'pages#show', id: 'help/index',             as: 'help'
  get 'help/how-to-use',  to: 'pages#show', id: 'help/how_to_use/index',  as: 'how_to_use'
  get 'help/faq',         to: 'pages#show', id: 'help/faq/index',         as: 'faq'

  # Static pages
  get '/blog' => redirect("http://blog.consul/")
  resources :pages, path: '/', only: [:show]
end
