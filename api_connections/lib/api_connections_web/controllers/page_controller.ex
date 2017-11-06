defmodule ApiConnectionsWeb.PageController do
  use ApiConnectionsWeb, :controller
  alias ApiConnections.Currency.Crypto

  def index(conn, _params) do
    render conn, "index.html"
  end
end
