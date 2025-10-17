defmodule Flyteidl2.Core.Variable do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.15.0", syntax: :proto3

  field :type, 1, type: Flyteidl2.Core.LiteralType
  field :description, 2, type: :string
  field :artifact_partial_id, 3, type: Flyteidl2.Core.ArtifactID, json_name: "artifactPartialId"
  field :artifact_tag, 4, type: Flyteidl2.Core.ArtifactTag, json_name: "artifactTag"
end

defmodule Flyteidl2.Core.VariableMap.VariablesEntry do
  @moduledoc false

  use Protobuf, map: true, protoc_gen_elixir_version: "0.15.0", syntax: :proto3

  field :key, 1, type: :string
  field :value, 2, type: Flyteidl2.Core.Variable
end

defmodule Flyteidl2.Core.VariableMap do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.15.0", syntax: :proto3

  field :variables, 1, repeated: true, type: Flyteidl2.Core.VariableMap.VariablesEntry, map: true
end

defmodule Flyteidl2.Core.TypedInterface do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.15.0", syntax: :proto3

  field :inputs, 1, type: Flyteidl2.Core.VariableMap
  field :outputs, 2, type: Flyteidl2.Core.VariableMap
end

defmodule Flyteidl2.Core.Parameter do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.15.0", syntax: :proto3

  oneof :behavior, 0

  field :var, 1, type: Flyteidl2.Core.Variable
  field :default, 2, type: Flyteidl2.Core.Literal, oneof: 0
  field :required, 3, type: :bool, oneof: 0

  field :artifact_query, 4,
    type: Flyteidl2.Core.ArtifactQuery,
    json_name: "artifactQuery",
    oneof: 0

  field :artifact_id, 5, type: Flyteidl2.Core.ArtifactID, json_name: "artifactId", oneof: 0
end

defmodule Flyteidl2.Core.ParameterMap.ParametersEntry do
  @moduledoc false

  use Protobuf, map: true, protoc_gen_elixir_version: "0.15.0", syntax: :proto3

  field :key, 1, type: :string
  field :value, 2, type: Flyteidl2.Core.Parameter
end

defmodule Flyteidl2.Core.ParameterMap do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.15.0", syntax: :proto3

  field :parameters, 1,
    repeated: true,
    type: Flyteidl2.Core.ParameterMap.ParametersEntry,
    map: true
end
