defmodule CursoElixirDb.ExplodingTopics.Manage do
  import CursoElixirDb.GetExplodingTopics

  def add_topic() do
    get_data()
    |> Enum.map(&CursoElixirDb.Registry.create_topic(CursoElixirDb.Registry, {:create, &1}))
  end
end
