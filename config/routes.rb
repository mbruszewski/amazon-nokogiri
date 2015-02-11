Rails.application.routes.draw do
  root 'main#index'
  get 'main/index'
  post 'main/navigate'
end
