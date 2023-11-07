defmodule NomadNibbles.FoodPermits do
  @moduledoc """
  The FoodPermits context.
  """

  import Ecto.Query, warn: false
  alias NomadNibbles.Repo

  alias NomadNibbles.FoodPermits.FoodPermit

  @doc """
  Returns the list of food_permits.

  ## Examples

      iex> list_food_permits()
      [%FoodPermit{}, ...]

  """
  def list_food_permits do
    Repo.all(FoodPermit)
  end

  @doc """
  Gets a single food_permit.

  Raises `Ecto.NoResultsError` if the Food permit does not exist.

  ## Examples

      iex> get_food_permit!(123)
      %FoodPermit{}

      iex> get_food_permit!(456)
      ** (Ecto.NoResultsError)

  """
  def get_food_permit!(id), do: Repo.get!(FoodPermit, id)

  @doc """
  Creates a food_permit.

  ## Examples

      iex> create_food_permit(%{field: value})
      {:ok, %FoodPermit{}}

      iex> create_food_permit(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_food_permit(attrs \\ %{}) do
    %FoodPermit{}
    |> FoodPermit.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a food_permit.

  ## Examples

      iex> update_food_permit(food_permit, %{field: new_value})
      {:ok, %FoodPermit{}}

      iex> update_food_permit(food_permit, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_food_permit(%FoodPermit{} = food_permit, attrs) do
    food_permit
    |> FoodPermit.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a food_permit.

  ## Examples

      iex> delete_food_permit(food_permit)
      {:ok, %FoodPermit{}}

      iex> delete_food_permit(food_permit)
      {:error, %Ecto.Changeset{}}

  """
  def delete_food_permit(%FoodPermit{} = food_permit) do
    Repo.delete(food_permit)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking food_permit changes.

  ## Examples

      iex> change_food_permit(food_permit)
      %Ecto.Changeset{data: %FoodPermit{}}

  """
  def change_food_permit(%FoodPermit{} = food_permit, attrs \\ %{}) do
    FoodPermit.changeset(food_permit, attrs)
  end
end
