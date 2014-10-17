# This file is responsible for configuring your application
use Mix.Config

# Note this file is loaded before any dependency and is restricted
# to this project. If another project depends on this project, this
# file won't be loaded nor affect the parent project.

config :phoenix, Scrapple.Router,
  url: [host: "localhost"],
  http: [port: System.get_env("PORT")],
  https: false,
  secret_key_base: "g70Jkz+NmWus9G8/Rco/jKpDx/5JPnIi3BofZ2xNQ5cHkEgoKmh2w9fw7RFbwPYNHeeHQKWgODLHSvyaGFRVNw==",
  catch_errors: true,
  debug_errors: false,
  error_controller: Scrapple.PageController

config :phoenix, Scrapple.Router,
  session: [store: :cookie,
            key: "_scrapple_key"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. Note, this must remain at the bottom of
# this file to properly merge your previous config entries.
import_config "#{Mix.env}.exs"
