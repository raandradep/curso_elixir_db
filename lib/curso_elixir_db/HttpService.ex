defmodule HttpService do
  use HTTPoison.Base

  @expected_fields ~w(
    info results id
  )

  def get(url) do
    case HTTPoison.get(url) do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
        {:ok, body}

      {:ok, %HTTPoison.Response{status_code: 404}} ->
        {:error, "Not Found 404"}

      {:error, %HTTPoison.Error{reason: reason}} ->
        {:error, reason}
    end
  end

  def character(id) do
    url = "https://rickandmortyapi.com/api/character/#{id}"
    {:ok, body} = get(url)
    map = parse_json_data(body)
  end

  def episode(id) do
    url = "https://rickandmortyapi.com/api/episode/#{id}"
    {:ok, body} = get(url)
    map = parse_json_data(body)
  end

  def location(id) do
    url = "https://rickandmortyapi.com/api/location/#{id}"
    {:ok, body} = get(url)
    map = parse_json_data(body)
  end

  defp parse_json_data(data) do
    Poison.Parser.parse!(data)
  end
end
