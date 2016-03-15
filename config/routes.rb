Rails.application.routes.draw do
  resources :events do
    resources :attendees
    resource :location, controller: 'event_locations'
  end

  root to: "events#index"
end
