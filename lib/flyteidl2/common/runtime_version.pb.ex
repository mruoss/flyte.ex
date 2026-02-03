defmodule Flyteidl2.Common.RuntimeMetadata.RuntimeType do
  @moduledoc false

  use Protobuf,
    enum: true,
    full_name: "flyteidl2.common.RuntimeMetadata.RuntimeType",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :OTHER, 0
  field :FLYTE_SDK, 1
  field :UNION_SDK, 2
end

defmodule Flyteidl2.Common.RuntimeMetadata do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.common.RuntimeMetadata",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :type, 1, type: Flyteidl2.Common.RuntimeMetadata.RuntimeType, enum: true
  field :version, 2, type: :string
  field :flavor, 3, type: :string
end
