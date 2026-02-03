defmodule Flyteidl2.Core.Primitive do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.core.Primitive",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  oneof :value, 0

  field :integer, 1, type: :int64, oneof: 0
  field :float_value, 2, type: :double, json_name: "floatValue", oneof: 0
  field :string_value, 3, type: :string, json_name: "stringValue", oneof: 0
  field :boolean, 4, type: :bool, oneof: 0
  field :datetime, 5, type: Google.Protobuf.Timestamp, oneof: 0
  field :duration, 6, type: Google.Protobuf.Duration, oneof: 0
end

defmodule Flyteidl2.Core.Void do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.core.Void",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3
end

defmodule Flyteidl2.Core.Blob do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.core.Blob",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :metadata, 1, type: Flyteidl2.Core.BlobMetadata
  field :uri, 3, type: :string
end

defmodule Flyteidl2.Core.BlobMetadata do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.core.BlobMetadata",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :type, 1, type: Flyteidl2.Core.BlobType
end

defmodule Flyteidl2.Core.Binary do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.core.Binary",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :value, 1, type: :bytes
  field :tag, 2, type: :string
end

defmodule Flyteidl2.Core.Schema do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.core.Schema",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :uri, 1, type: :string
  field :type, 3, type: Flyteidl2.Core.SchemaType
end

defmodule Flyteidl2.Core.Union do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.core.Union",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :value, 1, type: Flyteidl2.Core.Literal
  field :type, 2, type: Flyteidl2.Core.LiteralType
end

defmodule Flyteidl2.Core.StructuredDatasetMetadata do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.core.StructuredDatasetMetadata",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :structured_dataset_type, 1,
    type: Flyteidl2.Core.StructuredDatasetType,
    json_name: "structuredDatasetType"
end

defmodule Flyteidl2.Core.StructuredDataset do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.core.StructuredDataset",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :uri, 1, type: :string
  field :metadata, 2, type: Flyteidl2.Core.StructuredDatasetMetadata
end

defmodule Flyteidl2.Core.Scalar do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.core.Scalar",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  oneof :value, 0

  field :primitive, 1, type: Flyteidl2.Core.Primitive, oneof: 0
  field :blob, 2, type: Flyteidl2.Core.Blob, oneof: 0
  field :binary, 3, type: Flyteidl2.Core.Binary, oneof: 0
  field :schema, 4, type: Flyteidl2.Core.Schema, oneof: 0
  field :none_type, 5, type: Flyteidl2.Core.Void, json_name: "noneType", oneof: 0
  field :error, 6, type: Flyteidl2.Core.Error, oneof: 0
  field :generic, 7, type: Google.Protobuf.Struct, oneof: 0

  field :structured_dataset, 8,
    type: Flyteidl2.Core.StructuredDataset,
    json_name: "structuredDataset",
    oneof: 0

  field :union, 9, type: Flyteidl2.Core.Union, oneof: 0
end

defmodule Flyteidl2.Core.Literal.MetadataEntry do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.core.Literal.MetadataEntry",
    map: true,
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :key, 1, type: :string
  field :value, 2, type: :string
end

defmodule Flyteidl2.Core.Literal do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.core.Literal",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  oneof :value, 0

  field :scalar, 1, type: Flyteidl2.Core.Scalar, oneof: 0
  field :collection, 2, type: Flyteidl2.Core.LiteralCollection, oneof: 0
  field :map, 3, type: Flyteidl2.Core.LiteralMap, oneof: 0

  field :offloaded_metadata, 8,
    type: Flyteidl2.Core.LiteralOffloadedMetadata,
    json_name: "offloadedMetadata",
    oneof: 0

  field :hash, 4, type: :string
  field :metadata, 5, repeated: true, type: Flyteidl2.Core.Literal.MetadataEntry, map: true
end

defmodule Flyteidl2.Core.LiteralOffloadedMetadata do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.core.LiteralOffloadedMetadata",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :uri, 1, type: :string
  field :size_bytes, 2, type: :uint64, json_name: "sizeBytes"
  field :inferred_type, 3, type: Flyteidl2.Core.LiteralType, json_name: "inferredType"
end

defmodule Flyteidl2.Core.LiteralCollection do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.core.LiteralCollection",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :literals, 1, repeated: true, type: Flyteidl2.Core.Literal
end

defmodule Flyteidl2.Core.LiteralMap.LiteralsEntry do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.core.LiteralMap.LiteralsEntry",
    map: true,
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :key, 1, type: :string
  field :value, 2, type: Flyteidl2.Core.Literal
end

defmodule Flyteidl2.Core.LiteralMap do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.core.LiteralMap",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :literals, 1, repeated: true, type: Flyteidl2.Core.LiteralMap.LiteralsEntry, map: true
end

defmodule Flyteidl2.Core.BindingDataCollection do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.core.BindingDataCollection",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :bindings, 1, repeated: true, type: Flyteidl2.Core.BindingData
end

defmodule Flyteidl2.Core.BindingDataMap.BindingsEntry do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.core.BindingDataMap.BindingsEntry",
    map: true,
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :key, 1, type: :string
  field :value, 2, type: Flyteidl2.Core.BindingData
end

defmodule Flyteidl2.Core.BindingDataMap do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.core.BindingDataMap",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :bindings, 1, repeated: true, type: Flyteidl2.Core.BindingDataMap.BindingsEntry, map: true
end

defmodule Flyteidl2.Core.UnionInfo do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.core.UnionInfo",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :targetType, 1, type: Flyteidl2.Core.LiteralType
end

defmodule Flyteidl2.Core.BindingData do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.core.BindingData",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  oneof :value, 0

  field :scalar, 1, type: Flyteidl2.Core.Scalar, oneof: 0
  field :collection, 2, type: Flyteidl2.Core.BindingDataCollection, oneof: 0
  field :promise, 3, type: Flyteidl2.Core.OutputReference, oneof: 0
  field :map, 4, type: Flyteidl2.Core.BindingDataMap, oneof: 0

  field :offloaded_metadata, 6,
    type: Flyteidl2.Core.LiteralOffloadedMetadata,
    json_name: "offloadedMetadata",
    oneof: 0

  field :union, 5, type: Flyteidl2.Core.UnionInfo
end

defmodule Flyteidl2.Core.Binding do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.core.Binding",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :var, 1, type: :string
  field :binding, 2, type: Flyteidl2.Core.BindingData
end

defmodule Flyteidl2.Core.KeyValuePair do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.core.KeyValuePair",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :key, 1, type: :string
  field :value, 2, type: :string
end

defmodule Flyteidl2.Core.RetryStrategy do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.core.RetryStrategy",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :retries, 5, type: :uint32
end
