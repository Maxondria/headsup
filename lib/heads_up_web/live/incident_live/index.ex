defmodule HeadsUpWeb.IncidentLive.Index do
  use HeadsUpWeb, :live_view

  alias HeadsUp.Incidents
  alias HeadsUp.Incident

  import HeadsUpWeb.CustomComponents

  def mount(_params, _session, socket) do
    {:ok, socket |> assign(incidents: Incidents.list())}
  end

  def render(assigns) do
    ~H"""
    <div class="incident-index">
      <.headline :if={false}>
        <.icon name="hero-trophy-mini" /> 25 Incidents Resolved This Month!
        <:taglines :let={vibe}>
          Thanks for pitching in. <%= vibe %>
        </:taglines>
      </.headline>
      <div class="incidents">
        <.incident_card :for={incident <- @incidents} incident={incident} />
      </div>
    </div>
    """
  end

  attr :incident, Incident, required: true

  def incident_card(assigns) do
    ~H"""
    <.link navigate={~p"/incidents/#{@incident}"}>
      <div class="card">
        <img src={@incident.image_path} />
        <h2><%= @incident.name %></h2>
        <div class="details">
          <.badge status={@incident.status} />
          <div class="priority">
            <%= @incident.priority %>
          </div>
        </div>
      </div>
    </.link>
    """
  end
end
