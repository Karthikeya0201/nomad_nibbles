defmodule Mix.Tasks.ParseCsv do
  use Mix.Task

  alias NomadNibbles.{
    FoodPermits,
    Repo
  }

  alias NimbleCSV.RFC4180, as: CSV

  @shortdoc "Parses and inserts data from a CSV file into the FoodPermits table"

  def run(_args) do
    {:ok, _} = Application.ensure_all_started(:nomad_nibbles)
    Repo.start_link()

    file_path = "priv/data/food_permits.csv"

    file_path
    |> File.stream!()
    |> CSV.parse_stream()
    |> Enum.map(&convert_to_struct/1)

    IO.puts("Finished parsing and inserting data from #{file_path}")
    :ok
  end

  defp convert_to_struct(row) do
    %{
      location_id: get_value(row, 0) |> parse_int(),
      applicant: get_value(row, 1) |> truncate_string(),
      facility_type: get_value(row, 2) |> truncate_string(),
      cnn: get_value(row, 7) |> parse_int(),
      location_description: get_value(row, 8) |> truncate_string(),
      address: get_value(row, 3) |> truncate_string(),
      blocklot: get_value(row, 4) |> truncate_string(),
      block: get_value(row, 4) |> truncate_string(),
      lot: get_value(row, 5) |> truncate_string(),
      permit: get_value(row, 6) |> truncate_string(),
      status: get_value(row, 10) |> truncate_string(),
      food_items: get_value(row, 11) |> truncate_string(),
      x: get_value(row, 12) |> parse_float(),
      y: get_value(row, 13) |> parse_float(),
      latitude: get_value(row, 14) |> parse_float(),
      longitude: get_value(row, 15) |> parse_float(),
      schedule: get_value(row, 16) |> truncate_string(),
      days_hours: get_value(row, 17) |> truncate_string(),
      noisent: get_value(row, 18) |> parse_naive_datetime(),
      approved: get_value(row, 19) |> parse_naive_datetime(),
      received: get_value(row, 20) |> parse_naive_datetime(),
      prior_permit: get_value(row, 21) |> parse_bool(),
      expiration_date: get_value(row, 22) |> parse_naive_datetime(),
      location: get_value(row, 23) |> truncate_string(),
      fire_prevention_districts: get_value(row, 24) |> parse_int(),
      police_districts: get_value(row, 25) |> parse_int(),
      supervisor_districts: get_value(row, 26) |> parse_int(),
      zip_codes: get_value(row, 27) |> parse_int(),
      neighborhoods_old: get_value(row, 28) |> parse_int()
    }
    |> FoodPermits.create_food_permit()
    |> case do
      {:ok, _} ->
        {:ok, nil}

      {:error, reason} ->
        IO.puts("Failed to insert data from into the FoodPermits table: #{inspect(reason)}")
        {:error, nil}
    end
  end

  defp truncate_string(str, max_length \\ 255) do
    String.slice(str, 0, max_length)
  end

  defp parse_int(value) do
    case Integer.parse(value) do
      {int, _} -> int
      _ -> nil
    end
  end

  defp parse_float(value) do
    case Float.parse(value) do
      {float, _} -> float
      _ -> nil
    end
  end

  defp parse_bool(value), do: value == "1"

  defp parse_naive_datetime(value) do
    case parse_datetime(value) do
      {:ok, datetime} -> datetime
      {:error, _} -> nil
    end
  end

  defp get_value(row, index) do
    case row |> List.pop_at(index) do
      {value, _list} -> value
      _ -> nil
    end
  end

  defp parse_datetime(datetime_string) do
    format = "{0M}/{0D}/{YYYY} {h12}:{0m}:{0s} {AM}"

    case Timex.parse(datetime_string, format) do
      {:ok, datetime} ->
        {:ok, Timex.to_naive_datetime(datetime)}

      {:error, reason} ->
        {:error, reason}
    end
  end
end
