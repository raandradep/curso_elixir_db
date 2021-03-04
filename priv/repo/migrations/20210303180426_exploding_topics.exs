defmodule CursoElixirDb.Repo.Migrations.ExplodingTopics do
  use Ecto.Migration

  def change do
    create table(:exploding_topics) do
      add :title, :string
      add :description, :string
      add :searches, :string
      add :growth, :string
    end
  end
end
