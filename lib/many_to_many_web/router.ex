defmodule ManyToManyWeb.Router do
  use ManyToManyWeb, :router

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

  scope "/", ManyToManyWeb do
    pipe_through :browser

    get "/", PageController, :index
    resources "/tags", TagController
    resources "/images", ImageController
  end

  # Other scopes may use custom stacks.
  # scope "/api", ManyToManyWeb do
  #   pipe_through :api
  # end
end
