defmodule ApiConnections.Currency.Crypto do
  def connect() do
    {:ok, socket} = WebsocketClient.start_link(self, "wss://streamer.cryptocompare.com")
    WebsocketClient.join(socket, 'subAdd', %{subs: ['0~Poloniex~BTC~USD']})
  end
end