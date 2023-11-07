defmodule NomadNibblesWeb.Schema.Resolvers.FoodPermits do
  alias NomadNibbles.FoodPermits

  def list_food_permits(_parent, _args, _info) do
    {:ok, FoodPermits.list_food_permits()}
  end

  def get_food_permit(_parent, %{id: id}, _info) do
    {:ok, FoodPermits.get_food_permit!(id)}
  end
end
