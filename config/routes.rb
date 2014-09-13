Rails.application.routes.draw do
  get 'application/info', to: 'info#show'
end
