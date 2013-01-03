Damp::Application.routes.draw do

  resources :tickets

  devise_for :users

 # authenticated :user do
    root :to => 'tickets#index'
 # end    

  match '/find_project/:id', :controller => "tickets", :action =>"find_project", :via => [:get]

  match '/find_user/:id', :controller => "tickets", :action =>"find_user", :via => [:get]  

  match '/export_xls', :controller => "tickets", :action =>"export_xls", :via => [:get]
 
  match '/show_tic/:id', :controller => "tickets", :action =>"show_tic", :via => [:get]

  
end
