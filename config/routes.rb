Rails.application.routes.draw do
  resources :students, only: [:index, :show] 

  get '/students/:id/activat', to: 'students#activate', as: 'activate_student'
end
