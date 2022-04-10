Rails.application.routes.draw do
  # get "/", controller: "movies", action: "index"
  get "/" => "movies#index"

  # Routes for the Movie resource:

  # CREATE
  post "/movies" => "movies#create", as: :movies #gives us movies_url and movies_path, it just returns string and totally ignores the verb, so we don't have to rename other routes with different verb
  get "/movies/new" => "movies#new", as: :new_movie #new_movie_url and new_movie_path
          
  # READ
  get "/movies" => "movies#index"
  get "/movies/:id" => "movies#show", as: :movie #movie_path() and expects an argument to populate id segment
  
  # UPDATE
  patch "/movies/:id" => "movies#update"
  get "/movies/:id/edit" => "movies#edit", as: :edit_movie #edit_movie_path(), expects an argument to populate :id segment
  
  # DELETE
  delete "/movies/:id" => "movies#destroy"

  #------------------------------
end