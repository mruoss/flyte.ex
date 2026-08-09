defmodule Flyteidl2.Common.RelationType do
  @moduledoc false

  use Protobuf,
    enum: true,
    full_name: "flyteidl2.common.RelationType",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :RELATION_TYPE_UNSPECIFIED, 0
  field :RELATION_TYPE_RERUN, 1
  field :RELATION_TYPE_RECOVER, 2
  field :RELATION_TYPE_SPAWN, 3
  field :RELATION_TYPE_TRIGGERED, 4
  field :RELATION_TYPE_ON_ARTIFACT, 5
end

defmodule Flyteidl2.Common.OffloadedInputData do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.common.OffloadedInputData",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :uri, 1, type: :string, deprecated: false
  field :inputs_hash, 2, type: :string, json_name: "inputsHash", deprecated: false
end

defmodule Flyteidl2.Common.Relation do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.common.Relation",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :related_to, 1,
    type: Flyteidl2.Common.RunIdentifier,
    json_name: "relatedTo",
    deprecated: false

  field :relation_type, 2,
    type: Flyteidl2.Common.RelationType,
    json_name: "relationType",
    enum: true,
    deprecated: false
end
