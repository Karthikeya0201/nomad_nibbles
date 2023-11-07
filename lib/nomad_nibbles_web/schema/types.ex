defmodule NomadNibblesWeb.Schema.Types do
  use Absinthe.Schema.Notation

  @desc "A food permit"
  object :food_permit do
    field :id, :id
    field :location_id, :integer
    field :applicant, :string
    field :facility_type, :string
    field :cnn, :integer
    field :location_description, :string
    field :address, :string
    field :blocklot, :string
    field :block, :string
    field :lot, :string
    field :permit, :string
    field :status, :string
    field :food_items, :string
    field :x, :float
    field :y, :float
    field :latitude, :float
    field :longitude, :float
    field :schedule, :string
    field :dayshours, :string
    field :noisent, :datetime
    field :received, :datetime
    field :prior_permit, :boolean
    field :expiration_date, :datetime
    field :location, :string
    field :fire_prevention_districts, :integer
    field :police_districts, :integer
    field :supervisor_districts, :integer
    field :zip_codes, :integer
    field :neighborhoods_old, :integer
  end

  @desc """
  The `DateTime` scalar type represents a date and time in the UTC
  timezone. The DateTime appears in a JSON response as an ISO8601 formatted
  string, including UTC timezone ("Z"). The parsed date and time string will
  be converted to UTC and any UTC offset other than 0 will be rejected.
  """
  scalar :datetime, name: "DateTime" do
    serialize(&DateTime.to_iso8601/1)
    parse(&parse_datetime/1)
  end

  @spec parse_datetime(Absinthe.Blueprint.Input.String.t()) :: {:ok, DateTime.t()} | :error
  @spec parse_datetime(Absinthe.Blueprint.Input.Null.t()) :: {:ok, nil}
  defp parse_datetime(%Absinthe.Blueprint.Input.String{value: value}) do
    case DateTime.from_iso8601(value) do
      {:ok, datetime, 0} -> {:ok, datetime}
      {:ok, _datetime, _offset} -> :error
      _error -> :error
    end
  end

  defp parse_datetime(%Absinthe.Blueprint.Input.Null{}) do
    {:ok, nil}
  end

  defp parse_datetime(_) do
    :error
  end
end
