defmodule ApiConnections.Currency do
  @moduledoc """
  The Currency context.
  """
  alias ApiConnections.Currency.Exchange

  defmodule Rate do
    @derive [Poison.Encoder]
    defstruct [:name, :rate]
  end

  def list_exchanges(base) do
    {:ok, result} = Exchange.get("/latest?base=" <> base).body
    result["rates"]
    # |> Enum.map(fn({k,v}) -> {String.to_atom(k), v} end)
    # |> IO.inspect
  end
end
