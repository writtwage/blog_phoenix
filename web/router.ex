defmodule BlogPhoenix.Router do
  use BlogPhoenix.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", BlogPhoenix do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    # NOTE added this because the html generator says to
    resources "/posts", PostController do
      # NOTE need to clarigy why use a block here
      post "/comment", PostController, :add_comment
    end

  end


  # Other scopes may use custom stacks.
  # scope "/api", BlogPhoenix do
  #   pipe_through :api
  # end
end
