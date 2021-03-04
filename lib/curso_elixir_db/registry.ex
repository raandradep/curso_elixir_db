defmodule CursoElixirDb.Registry do
  use GenServer

  alias CursoElixirDb.HelperExplodingTopic
  @impl true
  def init(:ok) do
    {:ok, %{}}
  end

  @impl true
  def handle_cast({:create, topic}, _) do
    result = HelperExplodingTopic.create_exploding_topic(topic)
    {:noreply, result}
  end

  # def save_topics({title, description, })

  @doc """
  Inicio el Genserver de Registry
  """
  def start_link(_) do
    GenServer.start_link(__MODULE__, :ok, name: __MODULE__)
  end

  def lookup(server, name) do
    GenServer.call(server, {:lookup, name})
  end

  def create_topic(server, map) do
    GenServer.cast(server, map)
  end
end
