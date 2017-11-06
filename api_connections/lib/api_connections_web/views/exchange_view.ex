defmodule ApiConnectionsWeb.ExchangeView do
  use ApiConnectionsWeb, :view
  alias ApiConnectionsWeb.ExchangeView

  def render("index.json", %{exchanges: exchanges}) do
    %{data: render_many(exchanges, ExchangeView, "exchange.json")}
  end

  def render("show.json", %{exchange: exchange}) do
    %{data: render_one(exchange, ExchangeView, "exchange.json")}
  end

  def render("exchange.json", %{exchange: exchange}) do
    {country, rate} = exchange
    %{country => rate}
  end
end
