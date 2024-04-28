defmodule Flyteidl.Core.ContainerError.Kind do
  @moduledoc false

  use Protobuf, enum: true, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :NON_RECOVERABLE, 0
  field :RECOVERABLE, 1
end

defmodule Flyteidl.Core.ContainerError do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :code, 1, type: :string
  field :message, 2, type: :string
  field :kind, 3, type: Flyteidl.Core.ContainerError.Kind, enum: true
  field :origin, 4, type: Flyteidl.Core.ExecutionError.ErrorKind, enum: true
end

defmodule Flyteidl.Core.ErrorDocument do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :error, 1, type: Flyteidl.Core.ContainerError
end