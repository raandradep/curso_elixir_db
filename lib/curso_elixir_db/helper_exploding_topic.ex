defmodule CursoElixirDb.HelperExplodingTopic do
  @moduledoc """
  The HelperExplodingTopic context.
  """

  import Ecto.Query, warn: false
  alias CursoElixirDb.Repo
  alias CursoElixirDb.HelperExploding.ExplodingTopics

  def list_exploding_topics do
    Repo.all(ExplodingTopics)
  end

  def get_exploding_topic!(id), do: Repo.get!(ExplodingTopics, id)

  def create_exploding_topic(attrs \\ %{}) do
    %ExplodingTopics{}
    |> ExplodingTopics.changeset(attrs)
    |> Repo.insert()
  end

  # def create_exploding_topic_all([%ExplodingTopics{}] = arrTopics \\ []) do
  #            ExplodingTopics
  #           |> ExplodingTopics.changeset(arrTopics)
  #           |> Repo.insert_all(arrTopics)
  # end

  def create_exploding_topic_all(arr \\ []) do
    Repo.insert_all(ExplodingTopics, arr)
  end

  def update_exploding_topic(%ExplodingTopics{} = topics, attrs) do
    topics
    |> ExplodingTopics.changeset(attrs)
    |> Repo.update()
  end

  def get_data() do
    Repo.all(ExplodingTopics)
  end

  def delete(id) do
    Repo.get!(ExplodingTopics, id) |> Repo.delete()
  end
end
