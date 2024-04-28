defmodule Flyteidl.Core.Primitive do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  oneof :value, 0

  field :integer, 1, type: :int64, oneof: 0
  field :float_value, 2, type: :double, json_name: "floatValue", oneof: 0
  field :string_value, 3, type: :string, json_name: "stringValue", oneof: 0
  field :boolean, 4, type: :bool, oneof: 0
  field :datetime, 5, type: Google.Protobuf.Timestamp, oneof: 0
  field :duration, 6, type: Google.Protobuf.Duration, oneof: 0
end

defmodule Flyteidl.Core.Void do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"
end

defmodule Flyteidl.Core.Blob do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :metadata, 1, type: Flyteidl.Core.BlobMetadata
  field :uri, 3, type: :string
end

defmodule Flyteidl.Core.BlobMetadata do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :type, 1, type: Flyteidl.Core.BlobType
end

defmodule Flyteidl.Core.Binary do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :value, 1, type: :bytes
  field :tag, 2, type: :string
end

defmodule Flyteidl.Core.Schema do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :uri, 1, type: :string
  field :type, 3, type: Flyteidl.Core.SchemaType
end

defmodule Flyteidl.Core.Union do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :value, 1, type: Flyteidl.Core.Literal
  field :type, 2, type: Flyteidl.Core.LiteralType
end

defmodule Flyteidl.Core.StructuredDatasetMetadata do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :structured_dataset_type, 1,
    type: Flyteidl.Core.StructuredDatasetType,
    json_name: "structuredDatasetType"
end

defmodule Flyteidl.Core.StructuredDataset do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :uri, 1, type: :string
  field :metadata, 2, type: Flyteidl.Core.StructuredDatasetMetadata
end

defmodule Flyteidl.Core.Scalar do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  oneof :value, 0

  field :primitive, 1, type: Flyteidl.Core.Primitive, oneof: 0
  field :blob, 2, type: Flyteidl.Core.Blob, oneof: 0
  field :binary, 3, type: Flyteidl.Core.Binary, oneof: 0
  field :schema, 4, type: Flyteidl.Core.Schema, oneof: 0
  field :none_type, 5, type: Flyteidl.Core.Void, json_name: "noneType", oneof: 0
  field :error, 6, type: Flyteidl.Core.Error, oneof: 0
  field :generic, 7, type: Google.Protobuf.Struct, oneof: 0

  field :structured_dataset, 8,
    type: Flyteidl.Core.StructuredDataset,
    json_name: "structuredDataset",
    oneof: 0

  field :union, 9, type: Flyteidl.Core.Union, oneof: 0
end

defmodule Flyteidl.Core.Literal do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  oneof :value, 0

  field :scalar, 1, type: Flyteidl.Core.Scalar, oneof: 0
  field :collection, 2, type: Flyteidl.Core.LiteralCollection, oneof: 0
  field :map, 3, type: Flyteidl.Core.LiteralMap, oneof: 0
  field :hash, 4, type: :string
end

defmodule Flyteidl.Core.LiteralCollection do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :literals, 1, repeated: true, type: Flyteidl.Core.Literal
end

defmodule Flyteidl.Core.LiteralMap.LiteralsEntry do
  @moduledoc false

  use Protobuf, map: true, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :key, 1, type: :string
  field :value, 2, type: Flyteidl.Core.Literal
end

defmodule Flyteidl.Core.LiteralMap do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :literals, 1, repeated: true, type: Flyteidl.Core.LiteralMap.LiteralsEntry, map: true
end

defmodule Flyteidl.Core.BindingDataCollection do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :bindings, 1, repeated: true, type: Flyteidl.Core.BindingData
end

defmodule Flyteidl.Core.BindingDataMap.BindingsEntry do
  @moduledoc false

  use Protobuf, map: true, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :key, 1, type: :string
  field :value, 2, type: Flyteidl.Core.BindingData
end

defmodule Flyteidl.Core.BindingDataMap do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :bindings, 1, repeated: true, type: Flyteidl.Core.BindingDataMap.BindingsEntry, map: true
end

defmodule Flyteidl.Core.UnionInfo do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :targetType, 1, type: Flyteidl.Core.LiteralType
end

defmodule Flyteidl.Core.BindingData do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  oneof :value, 0

  field :scalar, 1, type: Flyteidl.Core.Scalar, oneof: 0
  field :collection, 2, type: Flyteidl.Core.BindingDataCollection, oneof: 0
  field :promise, 3, type: Flyteidl.Core.OutputReference, oneof: 0
  field :map, 4, type: Flyteidl.Core.BindingDataMap, oneof: 0
  field :union, 5, type: Flyteidl.Core.UnionInfo
end

defmodule Flyteidl.Core.Binding do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :var, 1, type: :string
  field :binding, 2, type: Flyteidl.Core.BindingData
end

defmodule Flyteidl.Core.KeyValuePair do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :key, 1, type: :string
  field :value, 2, type: :string
end

defmodule Flyteidl.Core.RetryStrategy do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :retries, 5, type: :uint32
end