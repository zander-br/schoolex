defmodule Schoolex.Repo do
  use Ecto.Repo,
    otp_app: :schoolex,
    adapter: Ecto.Adapters.Postgres
end
