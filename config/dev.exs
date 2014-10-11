use Mix.Config

config :phoenix, Scrapple.Router,
  port: System.get_env("PORT") || 4000,
  ssl: false,
  host: "localhost",
  cookies: true,
  session_key: "_scrapple_key",
  session_secret: "+KB61J*U)B^218D8L8^52DG0Q7$5F#8*@B7C!V#RTPH99180KL0Z6XQMUHH!VD&3=SL2^WBZ7",
  debug_errors: true

config :phoenix, :code_reloader,
  enabled: true

config :logger, :console,
  level: :debug


