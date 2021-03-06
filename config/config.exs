# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :gotcha,
  ecto_repos: [Gotcha.Repo]

# Configures the endpoint
config :gotcha, GotchaWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "WNe1iZEr2nF+aUmM/+b3VbXt4ZooT+aMqBCh3YqyM+jXTNrYipuyiGpL40aE6ZV8",
  render_errors: [view: GotchaWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: Gotcha.PubSub,
  live_view: [signing_salt: "VjgQqZ3c"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
