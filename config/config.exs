# This file is responsible for configuring your application
use Mix.Config

# Note this file is loaded before any dependency and is restricted
# to this project. If another project depends on this project, this
# file won't be loaded nor affect the parent project.

config :phoenix, Scrapple.Router,
  port: System.get_env("PORT"),
  ssl: false,
  static_assets: true,
  cookies: true,
  session_key: "_scrapple_key",
  session_secret: "+KB61J*U)B^218D8L8^52DG0Q7$5F#8*@B7C!V#RTPH99180KL0Z6XQMUHH!VD&3=SL2^WBZ7",
  catch_errors: true,
  debug_errors: false,
  error_controller: Scrapple.PageController

config :phoenix, :code_reloader,
  enabled: false

config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. Note, this must remain at the bottom of
# this file to properly merge your previous config entries.
import_config "#{Mix.env}.exs"
