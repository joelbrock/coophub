import Config

# For production, don't forget to configure the url host
# to something meaningful, Phoenix uses this information
# when generating URLs.
#
# Note we also include the path to a cache manifest
# containing the digested version of static files. This
# manifest is generated by the `mix phx.digest` task,
# which you should run after static files are built and
# before starting your production server.
config :coophub, CoophubWeb.Endpoint,
  server: true,
  force_ssl: [hsts: true, subdomains: true, host: nil],
  url: [host: "coophub.io", port: 443],
  http: [:inet6, port: System.get_env("PORT", "4000")],
  https: [
    :inet6,
    port: 4443,
    cipher_suite: :strong,
    keyfile: "priv/ssl/privkey.pem",
    certfile: "priv/ssl/fullchain.pem"
  ],
  secret_key_base: System.fetch_env!("SECRET_KEY_BASE"),
  cache_static_manifest: "priv/static/cache_manifest.json"

# Configures app options
config :coophub,
  fetch_max_repos: 100,
  # Configures Cachex
  cache_interval: 60

# Do not print debug messages in production
config :logger, level: :info
