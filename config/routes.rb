Rails.application.routes.draw do
  get '/survivors/:id/report', to: 'survivors#report'
  get '/survivors/statistics', to: 'survivors#statistics'
  resources :survivors
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
