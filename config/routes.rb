Rails.application.routes.draw do
  resources :events do
    resources :attendees
    resource :location, controller: 'event_locations'
    collection do
      get :latest
      post :bulk_delete
    end
    member do
      get :dashboard
      post :join
      post :withdraw
    end
  end

  root to: "events#index"
end
