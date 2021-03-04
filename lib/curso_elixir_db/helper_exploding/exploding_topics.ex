defmodule CursoElixirDb.HelperExploding.ExplodingTopics do
  use Ecto.Schema
  import Ecto.Changeset

  schema "exploding_topics" do
    field :title, :string
    field :description, :string
    field :searches, :string
    field :growth, :string
  end

  @doc false
  def changeset(exploding_topics, attrs) do
    exploding_topics
    |> cast(attrs, [:title, :description, :searches, :growth])
    |> validate_required([:title, :description, :searches, :growth])
  end
end
