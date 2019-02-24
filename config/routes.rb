Rails.application.routes.draw do
  root 'stat#index'
  post 'import', to: 'stat#import'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
