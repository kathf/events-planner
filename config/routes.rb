Rails.application.routes.draw do
  root 'events#index'

  resources :events do # an event has many tasks
    member do
      post :complete
    end

    collection do
      get :completed
      get :incomplete
    end

    resources :tasks do # a task belongs events

      member do
        post :complete
      end

      collection do
        get :incomplete
        get :completed
        get :upcoming
        get :overdue
      end

    end

  end #end of resources events

  resources :contacts do # a contact has many tasks
    resources :tasks # a task belongs to contacts

  end #end of resources tasks

end

# motives:
# - an event has many tasks
# - a task belongs to a contact

# - contacts has many tasks
# - a task belongs to an event

# - an event can have collection of contacts
