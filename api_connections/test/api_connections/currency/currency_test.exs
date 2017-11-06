defmodule ApiConnections.CurrencyTest do
  use ApiConnections.DataCase

  alias ApiConnections.Currency

  describe "exchanges" do
    alias ApiConnections.Currency.Exchange

    @valid_attrs %{}
    @update_attrs %{}
    @invalid_attrs %{}

    def exchange_fixture(attrs \\ %{}) do
      {:ok, exchange} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Currency.create_exchange()

      exchange
    end

    test "list_exchanges/0 returns all exchanges" do
      exchange = exchange_fixture()
      assert Currency.list_exchanges() == [exchange]
    end

    test "get_exchange!/1 returns the exchange with given id" do
      exchange = exchange_fixture()
      assert Currency.get_exchange!(exchange.id) == exchange
    end

    test "create_exchange/1 with valid data creates a exchange" do
      assert {:ok, %Exchange{} = exchange} = Currency.create_exchange(@valid_attrs)
    end

    test "create_exchange/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Currency.create_exchange(@invalid_attrs)
    end

    test "update_exchange/2 with valid data updates the exchange" do
      exchange = exchange_fixture()
      assert {:ok, exchange} = Currency.update_exchange(exchange, @update_attrs)
      assert %Exchange{} = exchange
    end

    test "update_exchange/2 with invalid data returns error changeset" do
      exchange = exchange_fixture()
      assert {:error, %Ecto.Changeset{}} = Currency.update_exchange(exchange, @invalid_attrs)
      assert exchange == Currency.get_exchange!(exchange.id)
    end

    test "delete_exchange/1 deletes the exchange" do
      exchange = exchange_fixture()
      assert {:ok, %Exchange{}} = Currency.delete_exchange(exchange)
      assert_raise Ecto.NoResultsError, fn -> Currency.get_exchange!(exchange.id) end
    end

    test "change_exchange/1 returns a exchange changeset" do
      exchange = exchange_fixture()
      assert %Ecto.Changeset{} = Currency.change_exchange(exchange)
    end
  end
end
