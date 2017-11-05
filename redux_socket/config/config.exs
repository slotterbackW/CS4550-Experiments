# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :redux_socket,
  ecto_repos: [ReduxSocket.Repo]

# Configures the endpoint
config :redux_socket, ReduxSocketWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "vdYvAvSIUhQ5X51aFkGnL7P+sxFtwTNS33zGYetSFnaJmzUykIMiJHDBG6dl391+",
  render_errors: [view: ReduxSocketWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: ReduxSocket.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
