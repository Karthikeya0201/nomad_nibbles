defmodule NomadNibbles.FoodPermitsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `NomadNibbles.FoodPermits` context.
  """

  @doc """
  Generate a food_permit.
  """
  def food_permit_fixture(attrs \\ %{}) do
    {:ok, food_permit} =
      attrs
      |> Enum.into(%{
        address: "some address",
        applicant: "some applicant",
        approved: ~N[2023-11-06 13:20:00],
        block: "some block",
        blocklot: "some blocklot",
        cnn: 42,
        dayshours: "some dayshours",
        expiration_date: ~N[2023-11-06 13:20:00],
        facility_type: "some facility_type",
        fire_prevention_districts: 42,
        food_items: "some food_items",
        latitude: 120.5,
        location: "some location",
        location_description: "some location_description",
        locationid: 42,
        longitude: 120.5,
        lot: "some lot",
        neighborhoods_old: "some neighborhoods_old",
        noisent: ~N[2023-11-06 13:20:00],
        permit: "some permit",
        police_districts: 42,
        prior_permit: true,
        received: ~N[2023-11-06 13:20:00],
        schedule: "some schedule",
        status: "some status",
        supervisor_districts: 42,
        x: 120.5,
        y: 120.5,
        zip_codes: 42
      })
      |> NomadNibbles.FoodPermits.create_food_permit()

    food_permit
  end
end
