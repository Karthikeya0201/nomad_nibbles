defmodule NomadNibbles.Repo.Migrations.CreateFoodPermits do
  use Ecto.Migration

  def change do
    create table(:food_permits) do
      add :location_id, :integer
      add :applicant, :string
      add :facility_type, :string
      add :cnn, :integer
      add :location_description, :string
      add :address, :string
      add :blocklot, :string
      add :block, :string
      add :lot, :string
      add :permit, :string
      add :status, :string
      add :food_items, :string
      add :x, :float
      add :y, :float
      add :latitude, :float
      add :longitude, :float
      add :schedule, :string
      add :dayshours, :string
      add :noisent, :naive_datetime
      add :approved, :naive_datetime
      add :received, :naive_datetime
      add :prior_permit, :boolean, default: false, null: false
      add :expiration_date, :naive_datetime
      add :location, :string
      add :fire_prevention_districts, :integer
      add :police_districts, :integer
      add :supervisor_districts, :integer
      add :zip_codes, :integer
      add :neighborhoods_old, :string

      timestamps(type: :utc_datetime)
    end
  end
end
