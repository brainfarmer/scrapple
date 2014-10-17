use Mix.Config

config :phoenix, Scrapple.Router,
  http: [port: System.get_env("PORT") || 4000],
  debug_errors: true

config :phoenix, :code_reloader, true
