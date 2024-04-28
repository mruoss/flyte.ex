defmodule Flyteidl.Admin.ClusterAssignment do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :cluster_pool_name, 3, type: :string, json_name: "clusterPoolName"
end