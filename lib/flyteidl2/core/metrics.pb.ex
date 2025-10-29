defmodule Flyteidl2.Core.ExecutionMetricResult do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.15.0", syntax: :proto3

  field :metric, 1, type: :string
  field :data, 2, type: Google.Protobuf.Struct
end
