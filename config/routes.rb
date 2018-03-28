Rails.application.routes.draw do
  # Routes for the Friend request resource:

  # CREATE
  get("/friend_requests/new", { :controller => "friend_requests", :action => "new_form" })
  post("/create_friend_request", { :controller => "friend_requests", :action => "create_row" })

  # READ
  get("/friend_requests", { :controller => "friend_requests", :action => "index" })
  get("/friend_requests/:id_to_display", { :controller => "friend_requests", :action => "show" })

  # UPDATE
  get("/friend_requests/:prefill_with_id/edit", { :controller => "friend_requests", :action => "edit_form" })
  post("/update_friend_request/:id_to_modify", { :controller => "friend_requests", :action => "update_row" })

  # DELETE
  get("/delete_friend_request/:id_to_remove", { :controller => "friend_requests", :action => "destroy_row" })

  #------------------------------

  devise_for :users
  # Routes for the User resource:

  # READ
  get("/users", { :controller => "users", :action => "index" })
  get("/users/:id_to_display", { :controller => "users", :action => "show" })

  #------------------------------

  # Routes for the Casting resource:

  # CREATE
  get("/castings/new", { :controller => "castings", :action => "new_form" })
  post("/create_casting", { :controller => "castings", :action => "create_row" })

  # READ
  get("/castings", { :controller => "castings", :action => "index" })
  get("/castings/:id_to_display", { :controller => "castings", :action => "show" })

  # UPDATE
  get("/castings/:prefill_with_id/edit", { :controller => "castings", :action => "edit_form" })
  post("/update_casting/:id_to_modify", { :controller => "castings", :action => "update_row" })

  # DELETE
  get("/delete_casting/:id_to_remove", { :controller => "castings", :action => "destroy_row" })

  #------------------------------

  # Routes for the Actor resource:

  # CREATE
  get("/actors/new", { :controller => "actors", :action => "new_form" })
  post("/create_actor", { :controller => "actors", :action => "create_row" })

  # READ
  get("/actors", { :controller => "actors", :action => "index" })
  get("/actors/:id_to_display", { :controller => "actors", :action => "show" })

  # UPDATE
  get("/actors/:prefill_with_id/edit", { :controller => "actors", :action => "edit_form" })
  post("/update_actor/:id_to_modify", { :controller => "actors", :action => "update_row" })

  # DELETE
  get("/delete_actor/:id_to_remove", { :controller => "actors", :action => "destroy_row" })

  #------------------------------

  # Routes for the Director resource:

  # CREATE
  get("/directors/new", { :controller => "directors", :action => "new_form" })
  post("/create_director", { :controller => "directors", :action => "create_row" })

  # READ
  get("/directors", { :controller => "directors", :action => "index" })
  get("/directors/:id_to_display", { :controller => "directors", :action => "show" })

  # UPDATE
  get("/directors/:prefill_with_id/edit", { :controller => "directors", :action => "edit_form" })
  post("/update_director/:id_to_modify", { :controller => "directors", :action => "update_row" })

  # DELETE
  get("/delete_director/:id_to_remove", { :controller => "directors", :action => "destroy_row" })

  #------------------------------

  # Routes for the Movie resource:

  # CREATE
  get("/movies/new", { :controller => "movies", :action => "new_form" })
  post("/create_movie", { :controller => "movies", :action => "create_row" })

  # READ
  get("/movies", { :controller => "movies", :action => "index" })
  get("/movies/:id_to_display", { :controller => "movies", :action => "show" })

  # UPDATE
  get("/movies/:prefill_with_id/edit", { :controller => "movies", :action => "edit_form" })
  post("/update_movie/:id_to_modify", { :controller => "movies", :action => "update_row" })

  # DELETE
  get("/delete_movie/:id_to_remove", { :controller => "movies", :action => "destroy_row" })

  #------------------------------

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
