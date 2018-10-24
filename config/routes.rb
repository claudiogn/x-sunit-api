Rails.application.routes.draw do
	scope module: 'v1' do  
	  post '/survivors/:id/report', to: 'survivors#report'
	  get '/survivors/statistics', to: 'survivors#statistics'
	  resources :survivors
	end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
