Music::Application.routes.draw do




  get('/song_room_search_collaborators', { :controller => "SongRooms", :action => 'song_room_search_collaborators', :as => 'search_collaborators'})

  resources :searches

  match 'download/:id' =>  'versions#download', :as => :download



  resources :versions do 
    resources :messages
    member { post :vote}
  end
  
  post('/collaborators', {:controller => "Collaborators", :action => 'create', :as => 'create_collaborator'})
  delete('song_rooms/:id/collaborators/:id', { :controller => "Collaborators", :action => 'destroy', :as => 'delete_collaborator'})

  resources :song_rooms do 
    resources :collaborators
  end

  put('/accept/:id', {:controller => "Requests", :action => 'accept', :as => 'accept'})
  put('/deny/:id', {:controller => "Requests", :action => 'deny', :as => 'deny'})
  

  resources :user_song_uploads

  # get('/home', { :controller => 'WelcomePages', :action => 'home'})
  
  # devise_for :users, :controllers => { :registrations => "registrations", :omniauth_callbacks => "users/omniauth_callbacks" }
  
  resources :users

  # root :to => 'welcome_pages#home'
#   
  # get('/', { controller: "WelcomePages" , action: "index"})
#   get('/home', { controller: "WelcomePages" , action: "home"})
  
  
  
  
  
  
  
  # root :to => 'welcome_pages#index'
  
  # devise_for :users, :controllers => { :registrations => "registrations", :omniauth_callbacks => "users/omniauth_callbacks" }
  
  # namespace :user do
# 		root :to => "welcome_pages#home"
# 	end

  # root :to => "welcome_pages#index" , :as => "home"
  
  devise_for :users, :controllers => { :registrations => "registrations", :omniauth_callbacks => "users/omniauth_callbacks" }
  
  devise_scope :user do
		get "/register" , to: "devise/registrations#new" , :as => "register"
		get "/edit/account" , to: "devise/registrations#edit" , :as => "edit_account"
		
		get "/login" , to: "devise/sessions#new" , :as => "login"
		get "/logout" , to: "devise/sessions#destroy" , :as => "logout"
	end
	
	authenticated :user do
    root :to => "welcome_pages#home" , :as => "user_home"
  end
  root :to => "welcome_pages#index" , :as => "home"

end
