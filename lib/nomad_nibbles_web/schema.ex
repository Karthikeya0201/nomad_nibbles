defmodule NomadNibblesWeb.Schema do
  use Absinthe.Schema

  alias NomadNibblesWeb.Schema.Resolvers.FoodPermits

  import_types(NomadNibblesWeb.Schema.Types)

  query do
    @desc "Returns a list of food permits"
    field :food_permits, list_of(:food_permit) do
      resolve(&FoodPermits.list_food_permits/3)
    end

    @desc "Returns a single food permit"
    field :food_permit, :food_permit do
      arg(:id, non_null(:id))
      resolve(&FoodPermits.get_food_permit/3)
    end
  end
end
