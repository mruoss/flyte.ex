defmodule Flyteidl2.Core.ContainerError.Kind do
  @moduledoc false

  use Protobuf, enum: true, protoc_gen_elixir_version: "0.15.0", syntax: :proto3

  field :NON_RECOVERABLE, 0
  field :RECOVERABLE, 1
end

defmodule Flyteidl2.Core.ContainerError do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.15.0", syntax: :proto3

  field :code, 1, type: :string
  field :message, 2, type: :string
  field :kind, 3, type: Flyteidl2.Core.ContainerError.Kind, enum: true
  field :origin, 4, type: Flyteidl2.Core.ExecutionError.ErrorKind, enum: true
end

defmodule Flyteidl2.Core.ErrorDocument do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.15.0", syntax: :proto3

  field :error, 1, type: Flyteidl2.Core.ContainerError
end
