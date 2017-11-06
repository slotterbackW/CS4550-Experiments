defmodule ApiConnectionsWeb.ExchangeController do
  use ApiConnectionsWeb, :controller

  alias ApiConnections.Currency
  alias ApiConnections.Currency.Exchange

  action_fallback ApiConnectionsWeb.FallbackController

  def index(conn, _params) do
    exchanges = Currency.list_exchanges("USD")
    render(conn, "index.json", exchanges: exchanges)
  end

  # def show(conn, %{"id" => id}) do
  #   exchange = Currency.get_exchange!(id)
  #   render(conn, "show.json", exchange: exchange)
  # end
end
