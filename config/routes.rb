Rails.application.routes.draw do
  root 'events#index'

   resources :events do
     resources :tasks
   end

   resources :contacts

end
