Rails.application.routes.draw do
  devise_for :users
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

  scope :controller => "events", :path => "/foo", :as => "foo" do
    match 'events/:id' => :show, via: "get", constraints: { id: /[0-9]/ }
    get 'events' => :index
  end

  # scope :path => '/api/v1/', :module => "api_v1", :as => 'v1' do
  # end

  root to: "events#index"
end
