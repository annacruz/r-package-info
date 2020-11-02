Rails.application.routes.draw do
  get 'packages/index'
  
  root 'packages#index'
end
