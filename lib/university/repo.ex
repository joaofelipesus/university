defmodule University.Repo do
  use Ecto.Repo,
    otp_app: :university,
    adapter: Ecto.Adapters.Postgres
end
