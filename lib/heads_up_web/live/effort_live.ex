defmodule HeadsUpWeb.EffortLive do
  use HeadsUpWeb, :live_view

  def mount(_params, _session, socket) do
    {:ok,
     socket
     |> assign(responders: 0, minutes_per_responder: 10)}
  end

  def render(assigns) do
    ~H"""
    <div class="effort">
      <h1>Community Love</h1>
      <section>
        <button phx-click="add" phx-value-responders="3">
          + 3
        </button>
        <div>
          <%= @responders %>
        </div>
        *
        <div>
          <%= @minutes_per_responder %>
        </div>
        =
        <div>
          <%= @responders * @minutes_per_responder %>
        </div>
      </section>

      <form phx-submit="recalculate">
        <label>Minutes Per Responder:</label>
        <input type="number" name="minutes" value={@minutes_per_responder} />
      </form>
    </div>
    """
  end

  def handle_event("add", %{"responders" => responders}, socket) do
    responders = String.to_integer(responders)
    {:noreply, socket |> update(:responders, &(&1 + responders))}
  end

  def handle_event("recalculate", %{"minutes" => minutes}, socket) do
    minutes = String.to_integer(minutes)
    {:noreply, socket |> assign(:minutes_per_responder, minutes)}
  end
end
