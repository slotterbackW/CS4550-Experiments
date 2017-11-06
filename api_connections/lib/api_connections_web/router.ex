defmodule ApiConnectionsWeb.Router do
  use ApiConnectionsWeb, :router

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

  scope "/", ApiConnectionsWeb do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
  end

  scope "/api", ApiConnectionsWeb do
    pipe_through :api

    resources "/exchanges", ExchangeController, except: [:new, :edit]
  end

  # Other scopes may use custom stacks.
  # scope "/api", ApiConnectionsWeb do
  #   pipe_through :api
  # end
end
