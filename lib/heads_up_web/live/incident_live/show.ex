defmodule HeadsUpWeb.IncidentLive.Show do
  use HeadsUpWeb, :live_view

  alias HeadsUp.Incidents
  import HeadsUpWeb.CustomComponents

  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  def handle_params(%{"id" => id}, _uri, socket) do
    incident = Incidents.get_incident!(id)
    urgent = Incidents.get_urgent(incident)

    {:noreply,
     socket
     |> assign(
       incident: incident,
       urgent_incidents: urgent,
       page_title: incident.name
     )}
  end

  attr :incidents, :list, required: true

  def urgent_incidents(assigns) do
    ~H"""
    <section>
      <h4>Urgent Incidents</h4>
      <ul class="incidents">
        <li :for={incident <- @incidents}>
          <.link navigate={~p"/incidents/#{incident}"}>
            <img src={incident.image_path} />
            <%= incident.name %>
          </.link>
        </li>
      </ul>
    </section>
    """
  end
end
