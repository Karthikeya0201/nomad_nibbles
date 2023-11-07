defmodule NomadNibbles.Repo do
  use Ecto.Repo,
    otp_app: :nomad_nibbles,
    adapter: Ecto.Adapters.Postgres
end
