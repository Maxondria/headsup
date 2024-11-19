defmodule HeadsUpWeb.CustomComponents do
  use HeadsUpWeb, :html

  attr :status, :atom, required: true, values: [:pending, :resolved, :canceled]
  attr :class, :string, default: nil

  def badge(assigns) do
    ~H"""
    <div class={[
      "rounded-md px-2 py-1 text-xs font-medium uppercase inline-block border",
      @status == :pending && "text-amber-600 border-amber-600",
      @status == :resolved && "text-lime-600 border-lime-600",
      @status == :canceled && "text-gray-600 border-gray-600",
      @class
    ]}>
      <%= @status %>
    </div>
    """
  end

  slot :inner_block, required: true
  slot :taglines

  def headline(assigns) do
    assigns =
      assigns
      |> assign(
        :emoji,
        ~w(😎 🤩 🥳)
        |> Enum.random()
      )

    ~H"""
    <div class="headline">
      <h1>
        <%= render_slot(@inner_block) %>
      </h1>
      <div :for={tagline <- @taglines} class="tagline">
        <%= render_slot(tagline, @emoji) %>
      </div>
    </div>
    """
  end
end
