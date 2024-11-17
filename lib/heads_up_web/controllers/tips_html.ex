defmodule HeadsUpWeb.TipsHTML do
  use HeadsUpWeb, :html

  embed_templates "tips_html/*"

  def show(assigns) do
    ~H"""
    <div class="tips">
      <h1>You like a Tip, <%= @answer %>?</h1>
      <p><%= @tip.text %></p>
    </div>
    """
  end
end
