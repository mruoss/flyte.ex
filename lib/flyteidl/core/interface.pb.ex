defmodule Flyteidl.Core.Variable do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :type, 1, type: Flyteidl.Core.LiteralType
  field :description, 2, type: :string
end

defmodule Flyteidl.Core.VariableMap.VariablesEntry do
  @moduledoc false

  use Protobuf, map: true, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :key, 1, type: :string
  field :value, 2, type: Flyteidl.Core.Variable
end

defmodule Flyteidl.Core.VariableMap do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :variables, 1, repeated: true, type: Flyteidl.Core.VariableMap.VariablesEntry, map: true
end

defmodule Flyteidl.Core.TypedInterface do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :inputs, 1, type: Flyteidl.Core.VariableMap
  field :outputs, 2, type: Flyteidl.Core.VariableMap
end

defmodule Flyteidl.Core.Parameter do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  oneof :behavior, 0

  field :var, 1, type: Flyteidl.Core.Variable
  field :default, 2, type: Flyteidl.Core.Literal, oneof: 0
  field :required, 3, type: :bool, oneof: 0
end

defmodule Flyteidl.Core.ParameterMap.ParametersEntry do
  @moduledoc false

  use Protobuf, map: true, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :key, 1, type: :string
  field :value, 2, type: Flyteidl.Core.Parameter
end

defmodule Flyteidl.Core.ParameterMap do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :parameters, 1,
    repeated: true,
    type: Flyteidl.Core.ParameterMap.ParametersEntry,
    map: true
end