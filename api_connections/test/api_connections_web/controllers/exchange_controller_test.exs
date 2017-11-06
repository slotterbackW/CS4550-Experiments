defmodule ApiConnectionsWeb.ExchangeControllerTest do
  use ApiConnectionsWeb.ConnCase

  alias ApiConnections.Currency
  alias ApiConnections.Currency.Exchange

  @create_attrs %{}
  @update_attrs %{}
  @invalid_attrs %{}

  def fixture(:exchange) do
    {:ok, exchange} = Currency.create_exchange(@create_attrs)
    exchange
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all exchanges", %{conn: conn} do
      conn = get conn, exchange_path(conn, :index)
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create exchange" do
    test "renders exchange when data is valid", %{conn: conn} do
      conn = post conn, exchange_path(conn, :create), exchange: @create_attrs
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get conn, exchange_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id}
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, exchange_path(conn, :create), exchange: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update exchange" do
    setup [:create_exchange]

    test "renders exchange when data is valid", %{conn: conn, exchange: %Exchange{id: id} = exchange} do
      conn = put conn, exchange_path(conn, :update, exchange), exchange: @update_attrs
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get conn, exchange_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id}
    end

    test "renders errors when data is invalid", %{conn: conn, exchange: exchange} do
      conn = put conn, exchange_path(conn, :update, exchange), exchange: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete exchange" do
    setup [:create_exchange]

    test "deletes chosen exchange", %{conn: conn, exchange: exchange} do
      conn = delete conn, exchange_path(conn, :delete, exchange)
      assert response(conn, 204)
      assert_error_sent 404, fn ->
        get conn, exchange_path(conn, :show, exchange)
      end
    end
  end

  defp create_exchange(_) do
    exchange = fixture(:exchange)
    {:ok, exchange: exchange}
  end
end
