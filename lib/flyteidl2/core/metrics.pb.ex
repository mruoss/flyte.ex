defmodule Flyteidl2.Core.ExecutionMetricResult do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.core.ExecutionMetricResult",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :metric, 1, type: :string
  field :data, 2, type: Google.Protobuf.Struct
end
