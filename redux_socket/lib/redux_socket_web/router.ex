defmodule ReduxSocketWeb.Router do
  use ReduxSocketWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
    resources "/tasks", ReduxSocketWeb.TaskController, except: [:new, :edit]
  end

  scope "/", ReduxSocketWeb do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
  end

  # Other scopes may use custom stacks.
  # scope "/api", ReduxSocketWeb do
  #   pipe_through :api
  # end
end
