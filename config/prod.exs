use Mix.Config

# NOTE: To get SSL working, you will need to set:
#
#     ssl: true,
#     keyfile: System.get_env("SOME_APP_SSL_KEY_PATH"),
#     certfile: System.get_env("SOME_APP_SSL_CERT_PATH"),
#
# Where those two env variables point to a file on disk
# for the key and cert

config :phoenix, Scrapple.Router,
  port: System.get_env("PORT"),
  ssl: false,
  host: "example.com",
  cookies: true,
  session_key: "_scrapple_key",
  session_secret: "+KB61J*U)B^218D8L8^52DG0Q7$5F#8*@B7C!V#RTPH99180KL0Z6XQMUHH!VD&3=SL2^WBZ7"

config :logger, :console,
  level: :info,
  metadata: [:request_id]

