defmodule NomadNibbles.FoodPermits.FoodPermit do
  use Ecto.Schema
  import Ecto.Changeset

  schema "food_permits" do
    field :block, :string
    field :status, :string
    field :address, :string
    field :permit, :string
    field :location, :string
    field :approved, :naive_datetime
    field :y, :float
    field :x, :float
    field :locationid, :integer
    field :applicant, :string
    field :facility_type, :string
    field :cnn, :integer
    field :location_description, :string
    field :blocklot, :string
    field :lot, :string
    field :food_items, :string
    field :latitude, :float
    field :longitude, :float
    field :schedule, :string
    field :dayshours, :string
    field :noisent, :naive_datetime
    field :received, :naive_datetime
    field :prior_permit, :boolean, default: false
    field :expiration_date, :naive_datetime
    field :fire_prevention_districts, :integer
    field :police_districts, :integer
    field :supervisor_districts, :integer
    field :zip_codes, :integer
    field :neighborhoods_old, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(food_permit, attrs) do
    food_permit
    |> cast(attrs, [:locationid, :applicant, :facility_type, :cnn, :location_description, :address, :blocklot, :block, :lot, :permit, :status, :food_items, :x, :y, :latitude, :longitude, :schedule, :dayshours, :noisent, :approved, :received, :prior_permit, :expiration_date, :location, :fire_prevention_districts, :police_districts, :supervisor_districts, :zip_codes, :neighborhoods_old])
    |> validate_required([:locationid, :applicant, :facility_type, :cnn, :location_description, :address, :blocklot, :block, :lot, :permit, :status, :food_items, :x, :y, :latitude, :longitude, :schedule, :dayshours, :noisent, :approved, :received, :prior_permit, :expiration_date, :location, :fire_prevention_districts, :police_districts, :supervisor_districts, :zip_codes, :neighborhoods_old])
  end
end
