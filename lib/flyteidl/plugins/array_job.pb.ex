defmodule Flyteidl.Plugins.ArrayJob do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  oneof :success_criteria, 0

  field :parallelism, 1, type: :int64
  field :size, 2, type: :int64
  field :min_successes, 3, type: :int64, json_name: "minSuccesses", oneof: 0
  field :min_success_ratio, 4, type: :float, json_name: "minSuccessRatio", oneof: 0
end