# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :cipherapp,
  ecto_repos: [Cipherapp.Repo]

# Configures the endpoint
config :cipherapp, Cipherapp.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "xaqjFiHKxQtu7eb+w54nGslUPEdkD0QQi9YoBIjA239u2KwNApeXwKH74BXUYs8v",
  render_errors: [view: Cipherapp.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Cipherapp.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
