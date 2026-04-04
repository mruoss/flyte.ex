defmodule Flyteidl2.Common.OffloadedInputData do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.common.OffloadedInputData",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :uri, 1, type: :string, deprecated: false
  field :inputs_hash, 2, type: :string, json_name: "inputsHash", deprecated: false
end
