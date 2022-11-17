Rails.application.routes.draw do

  resources :directors
  # # Routes for the Director resource:

  # # CREATE
  # post("/insert_director", { :controller => "directors", :action => "create" })
          
  # # READ
  # get("/directors", { :controller => "directors", :action => "index" })
  
  # get("/directors/:path_id", { :controller => "directors", :action => "show" })
  
  # # UPDATE
  
  # post("/modify_director/:path_id", { :controller => "directors", :action => "update" })
  
  # # DELETE
  # get("/delete_director/:path_id", { :controller => "directors", :action => "destroy" })

  # #------------------------------

  # get "/", controller: "movies", action: "index" 

  # get "/" => "movies#index"

  root "movies#index"

  # Routes for the Movie resource:

  resources :movies

  # # CREATE
  # post "/movies" =>  "movies#create", as: :movies # movies_url and movies_path
  # get "/movies/new" =>  "movies#new", as: :new_movie # new_movie_url and new_movie_path
          
  # # READ
  # get "/movies" =>  "movies#index"
  # get "/movies/:id" =>  "movies#show", as: :movie # movie_path() (expects an argument to populate :id segment)
  
  # # UPDATE
  # patch "/movies/:id" =>  "movies#update"
  # get "/movies/:id/edit" =>  "movies#edit", as: :edit_movie # edit_movie_path() (expects an argument to populate :id segment)
  
  # # DELETE
  # delete "/movies/:id" =>  "movies#destroy"

  #------------------------------
end