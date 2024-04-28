defmodule Flyteidl.Plugins.PrestoQuery do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :routing_group, 1, type: :string, json_name: "routingGroup"
  field :catalog, 2, type: :string
  field :schema, 3, type: :string
  field :statement, 4, type: :string
end