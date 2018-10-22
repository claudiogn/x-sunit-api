Rails.application.routes.draw do
  resources :survivors
  get '/survivor/:id/report', to: 'survivor#report'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
