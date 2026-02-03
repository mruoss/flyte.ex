defmodule Flyteidl2.Plugins.PrestoQuery do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.plugins.PrestoQuery",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :routing_group, 1, type: :string, json_name: "routingGroup"
  field :catalog, 2, type: :string
  field :schema, 3, type: :string
  field :statement, 4, type: :string
end
