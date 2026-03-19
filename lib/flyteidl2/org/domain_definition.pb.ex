defmodule Flyteidl2.Org.Domain do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.org.Domain",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :id, 1, type: :string, deprecated: false
  field :org, 2, type: :string, deprecated: false
  field :friendly_name, 3, type: :string, json_name: "friendlyName", deprecated: false
  field :created_at, 4, type: Google.Protobuf.Timestamp, json_name: "createdAt"
end
