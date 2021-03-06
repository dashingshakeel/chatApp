defmodule Chatto.Router do
  use Chatto.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug Chatto.Auth, repo: Chatto.Repo
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Chatto do
    pipe_through :browser # 
    get "/page",PageController,:page
    get "/", PageController, :index
    resources "/sessions", SessionController, only: [:new, :create, :delete]
    resources "/users", UserController, only: [:index, :show, :new, :create]
  end

  # Other scopes may use custom stacks.
  # scope "/api", Chatto do
  #   pipe_through :api
  # end
end
