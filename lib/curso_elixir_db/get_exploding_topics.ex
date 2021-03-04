defmodule CursoElixirDb.GetExplodingTopics do
  import HttpService

  def get_data() do
    "https://explodingtopics.com/"
    |> build_data()
  end

  defp build_data(url) do
    url
    |> get()
    |> elem(1)
    |> Floki.find(".tileInnerContainer")
    |> Enum.map(&build_map_data/1)
  end

  defp build_map_data(item) do
    title = item |> get_text(".tileKeyword")
    description = item |> get_text(".tileDescription")
    tagsItem = item |> get_text(".scoreTagItem")
    [searches | growth] = ~w{#{tagsItem}}
    %{title: title, description: description, growth: growth |> Enum.join(), searches: searches}
  end

  defp get_text(item, tag) do
    item |> Floki.find(tag) |> Floki.text()
  end
end
