use Mix.Config

# Configure your database
config :many_to_many, ManyToMany.Repo,
  username: "postgres",
  password: "postgres",
  database: "many_to_many_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :many_to_many, ManyToManyWeb.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn
