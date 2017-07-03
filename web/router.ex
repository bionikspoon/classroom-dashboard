defmodule Dashboard.Router do
  use Dashboard.Web, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", Dashboard do
    pipe_through :api

    resources "/users", UserController, except: [:new, :edit]
  end
end
