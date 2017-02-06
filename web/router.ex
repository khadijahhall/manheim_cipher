defmodule Cipherapp.Router do
  use Cipherapp.Web, :router

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

  scope "/", Cipherapp do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    post "/", PageController, :create
    get "/display", PageController, :show

  end

  # Other scopes may use custom stacks.
  # scope "/api", Cipherapp do
  #   pipe_through :api
  # end
end
