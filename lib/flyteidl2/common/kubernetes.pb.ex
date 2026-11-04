defmodule Flyteidl2.Common.K8sMetadata do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.common.K8sMetadata",
    protoc_gen_elixir_version: "0.17.1",
    syntax: :proto3

  field :namespace, 1, type: :string, deprecated: false
end
