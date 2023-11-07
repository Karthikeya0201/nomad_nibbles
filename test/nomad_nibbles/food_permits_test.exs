defmodule NomadNibbles.FoodPermitsTest do
  use NomadNibbles.DataCase

  alias NomadNibbles.FoodPermits

  describe "food_permits" do
    alias NomadNibbles.FoodPermits.FoodPermit

    import NomadNibbles.FoodPermitsFixtures

    @invalid_attrs %{block: nil, status: nil, address: nil, permit: nil, location: nil, approved: nil, y: nil, x: nil, locationid: nil, applicant: nil, facility_type: nil, cnn: nil, location_description: nil, blocklot: nil, lot: nil, food_items: nil, latitude: nil, longitude: nil, schedule: nil, dayshours: nil, noisent: nil, received: nil, prior_permit: nil, expiration_date: nil, fire_prevention_districts: nil, police_districts: nil, supervisor_districts: nil, zip_codes: nil, neighborhoods_old: nil}

    test "list_food_permits/0 returns all food_permits" do
      food_permit = food_permit_fixture()
      assert FoodPermits.list_food_permits() == [food_permit]
    end

    test "get_food_permit!/1 returns the food_permit with given id" do
      food_permit = food_permit_fixture()
      assert FoodPermits.get_food_permit!(food_permit.id) == food_permit
    end

    test "create_food_permit/1 with valid data creates a food_permit" do
      valid_attrs = %{block: "some block", status: "some status", address: "some address", permit: "some permit", location: "some location", approved: ~N[2023-11-06 13:20:00], y: 120.5, x: 120.5, locationid: 42, applicant: "some applicant", facility_type: "some facility_type", cnn: 42, location_description: "some location_description", blocklot: "some blocklot", lot: "some lot", food_items: "some food_items", latitude: 120.5, longitude: 120.5, schedule: "some schedule", dayshours: "some dayshours", noisent: ~N[2023-11-06 13:20:00], received: ~N[2023-11-06 13:20:00], prior_permit: true, expiration_date: ~N[2023-11-06 13:20:00], fire_prevention_districts: 42, police_districts: 42, supervisor_districts: 42, zip_codes: 42, neighborhoods_old: "some neighborhoods_old"}

      assert {:ok, %FoodPermit{} = food_permit} = FoodPermits.create_food_permit(valid_attrs)
      assert food_permit.block == "some block"
      assert food_permit.status == "some status"
      assert food_permit.address == "some address"
      assert food_permit.permit == "some permit"
      assert food_permit.location == "some location"
      assert food_permit.approved == ~N[2023-11-06 13:20:00]
      assert food_permit.y == 120.5
      assert food_permit.x == 120.5
      assert food_permit.locationid == 42
      assert food_permit.applicant == "some applicant"
      assert food_permit.facility_type == "some facility_type"
      assert food_permit.cnn == 42
      assert food_permit.location_description == "some location_description"
      assert food_permit.blocklot == "some blocklot"
      assert food_permit.lot == "some lot"
      assert food_permit.food_items == "some food_items"
      assert food_permit.latitude == 120.5
      assert food_permit.longitude == 120.5
      assert food_permit.schedule == "some schedule"
      assert food_permit.dayshours == "some dayshours"
      assert food_permit.noisent == ~N[2023-11-06 13:20:00]
      assert food_permit.received == ~N[2023-11-06 13:20:00]
      assert food_permit.prior_permit == true
      assert food_permit.expiration_date == ~N[2023-11-06 13:20:00]
      assert food_permit.fire_prevention_districts == 42
      assert food_permit.police_districts == 42
      assert food_permit.supervisor_districts == 42
      assert food_permit.zip_codes == 42
      assert food_permit.neighborhoods_old == "some neighborhoods_old"
    end

    test "create_food_permit/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = FoodPermits.create_food_permit(@invalid_attrs)
    end

    test "update_food_permit/2 with valid data updates the food_permit" do
      food_permit = food_permit_fixture()
      update_attrs = %{block: "some updated block", status: "some updated status", address: "some updated address", permit: "some updated permit", location: "some updated location", approved: ~N[2023-11-07 13:20:00], y: 456.7, x: 456.7, locationid: 43, applicant: "some updated applicant", facility_type: "some updated facility_type", cnn: 43, location_description: "some updated location_description", blocklot: "some updated blocklot", lot: "some updated lot", food_items: "some updated food_items", latitude: 456.7, longitude: 456.7, schedule: "some updated schedule", dayshours: "some updated dayshours", noisent: ~N[2023-11-07 13:20:00], received: ~N[2023-11-07 13:20:00], prior_permit: false, expiration_date: ~N[2023-11-07 13:20:00], fire_prevention_districts: 43, police_districts: 43, supervisor_districts: 43, zip_codes: 43, neighborhoods_old: "some updated neighborhoods_old"}

      assert {:ok, %FoodPermit{} = food_permit} = FoodPermits.update_food_permit(food_permit, update_attrs)
      assert food_permit.block == "some updated block"
      assert food_permit.status == "some updated status"
      assert food_permit.address == "some updated address"
      assert food_permit.permit == "some updated permit"
      assert food_permit.location == "some updated location"
      assert food_permit.approved == ~N[2023-11-07 13:20:00]
      assert food_permit.y == 456.7
      assert food_permit.x == 456.7
      assert food_permit.locationid == 43
      assert food_permit.applicant == "some updated applicant"
      assert food_permit.facility_type == "some updated facility_type"
      assert food_permit.cnn == 43
      assert food_permit.location_description == "some updated location_description"
      assert food_permit.blocklot == "some updated blocklot"
      assert food_permit.lot == "some updated lot"
      assert food_permit.food_items == "some updated food_items"
      assert food_permit.latitude == 456.7
      assert food_permit.longitude == 456.7
      assert food_permit.schedule == "some updated schedule"
      assert food_permit.dayshours == "some updated dayshours"
      assert food_permit.noisent == ~N[2023-11-07 13:20:00]
      assert food_permit.received == ~N[2023-11-07 13:20:00]
      assert food_permit.prior_permit == false
      assert food_permit.expiration_date == ~N[2023-11-07 13:20:00]
      assert food_permit.fire_prevention_districts == 43
      assert food_permit.police_districts == 43
      assert food_permit.supervisor_districts == 43
      assert food_permit.zip_codes == 43
      assert food_permit.neighborhoods_old == "some updated neighborhoods_old"
    end

    test "update_food_permit/2 with invalid data returns error changeset" do
      food_permit = food_permit_fixture()
      assert {:error, %Ecto.Changeset{}} = FoodPermits.update_food_permit(food_permit, @invalid_attrs)
      assert food_permit == FoodPermits.get_food_permit!(food_permit.id)
    end

    test "delete_food_permit/1 deletes the food_permit" do
      food_permit = food_permit_fixture()
      assert {:ok, %FoodPermit{}} = FoodPermits.delete_food_permit(food_permit)
      assert_raise Ecto.NoResultsError, fn -> FoodPermits.get_food_permit!(food_permit.id) end
    end

    test "change_food_permit/1 returns a food_permit changeset" do
      food_permit = food_permit_fixture()
      assert %Ecto.Changeset{} = FoodPermits.change_food_permit(food_permit)
    end
  end
end
