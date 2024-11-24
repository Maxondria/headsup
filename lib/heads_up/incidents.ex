defmodule HeadsUp.Incidents do
  alias HeadsUp.Incidents.Incident
  alias HeadsUp.Repo

  def list do
    Repo.all(Incident)
  end

  def get_incident!(id) do
    Repo.get!(Incident, id)
  end

  def get_urgent(incident) do
    list()
    |> Enum.filter(&(&1.id != incident.id))
  end
end
