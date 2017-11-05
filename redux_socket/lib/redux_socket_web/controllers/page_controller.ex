defmodule ReduxSocketWeb.PageController do
  use ReduxSocketWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
