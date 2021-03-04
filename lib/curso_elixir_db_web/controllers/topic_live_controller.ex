defmodule CursoElixirDbWeb.TopicLiveController do
  # If you generated an app with mix phx.new --live,
  # the line below would be: use MyAppWeb, :live_view
  use Phoenix.LiveView
  alias CursoElixirDb.HelperExplodingTopic
  # def render(assigns) do
  #   ~L"""
  #   Current temperature: <%= @temperature %>
  #   """
  # end

  def render(assigns) do
    Phoenix.View.render(CursoElixirDbWeb.TopicView, "vista.html", assigns)
  end

  def mount(_params, _, socket) do
    if connected?(socket), do: :timer.send_interval(10000, self(), :update)
    {:ok, assign(socket, :results, HelperExplodingTopic.get_data())}
  end

  def handle_info(:update, socket) do
    {:noreply, assign(socket, :results, HelperExplodingTopic.get_data())}
  end

  def handle_event("delete", %{"id" => id}, socket) do
    HelperExplodingTopic.delete(id)
    {:noreply, assign(socket, :results, HelperExplodingTopic.get_data())}
  end
end
