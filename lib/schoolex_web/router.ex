defmodule SchoolexWeb.Router do
  use SchoolexWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", SchoolexWeb do
    pipe_through :api
  end
end
