require "kemal"
require "json"
require "pg"
require "crecto"

module Repo
    extend Crecto::Repo
    config do |conf|
      conf.adapter = Crecto::Adapters::Postgres # or Crecto::Adapters::Mysql or Crecto::Adapters::SQLite3
      conf.database = "kemal"
      conf.hostname = "localhost"
      conf.username = "XXXXX"
      conf.password = "YYYYY"
      conf.port = 5432
      # you can also set initial_pool_size, max_pool_size, max_idle_pool_size,
      # checkout_timeout, retry_attempts, and retry_delay
    end
  end

  class User < Crecto::Model
      schema "users" do
        field :name, String
      end
      validate_required [:name]
      validate_format :name, /^[a-zA-Z]*$/
    end

get "/" do
  user = User.new
  user.name = "brad"
  Repo.insert(user)

end

Kemal.run(4567)
