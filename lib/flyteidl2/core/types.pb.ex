defmodule Flyteidl2.Core.SimpleType do
  @moduledoc false

  use Protobuf,
    enum: true,
    full_name: "flyteidl2.core.SimpleType",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :NONE, 0
  field :INTEGER, 1
  field :FLOAT, 2
  field :STRING, 3
  field :BOOLEAN, 4
  field :DATETIME, 5
  field :DURATION, 6
  field :BINARY, 7
  field :ERROR, 8
  field :STRUCT, 9
end

defmodule Flyteidl2.Core.SchemaType.SchemaColumn.SchemaColumnType do
  @moduledoc false

  use Protobuf,
    enum: true,
    full_name: "flyteidl2.core.SchemaType.SchemaColumn.SchemaColumnType",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :INTEGER, 0
  field :FLOAT, 1
  field :STRING, 2
  field :BOOLEAN, 3
  field :DATETIME, 4
  field :DURATION, 5
end

defmodule Flyteidl2.Core.BlobType.BlobDimensionality do
  @moduledoc false

  use Protobuf,
    enum: true,
    full_name: "flyteidl2.core.BlobType.BlobDimensionality",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :SINGLE, 0
  field :MULTIPART, 1
end

defmodule Flyteidl2.Core.SchemaType.SchemaColumn do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.core.SchemaType.SchemaColumn",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :name, 1, type: :string
  field :type, 2, type: Flyteidl2.Core.SchemaType.SchemaColumn.SchemaColumnType, enum: true
end

defmodule Flyteidl2.Core.SchemaType do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.core.SchemaType",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :columns, 3, repeated: true, type: Flyteidl2.Core.SchemaType.SchemaColumn
end

defmodule Flyteidl2.Core.StructuredDatasetType.DatasetColumn do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.core.StructuredDatasetType.DatasetColumn",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :name, 1, type: :string
  field :literal_type, 2, type: Flyteidl2.Core.LiteralType, json_name: "literalType"
end

defmodule Flyteidl2.Core.StructuredDatasetType do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.core.StructuredDatasetType",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :columns, 1, repeated: true, type: Flyteidl2.Core.StructuredDatasetType.DatasetColumn
  field :format, 2, type: :string
  field :external_schema_type, 3, type: :string, json_name: "externalSchemaType"
  field :external_schema_bytes, 4, type: :bytes, json_name: "externalSchemaBytes"
end

defmodule Flyteidl2.Core.BlobType do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.core.BlobType",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :format, 1, type: :string
  field :dimensionality, 2, type: Flyteidl2.Core.BlobType.BlobDimensionality, enum: true
end

defmodule Flyteidl2.Core.EnumType do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.core.EnumType",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :values, 1, repeated: true, type: :string
end

defmodule Flyteidl2.Core.UnionType do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.core.UnionType",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :variants, 1, repeated: true, type: Flyteidl2.Core.LiteralType
end

defmodule Flyteidl2.Core.TypeStructure.DataclassTypeEntry do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.core.TypeStructure.DataclassTypeEntry",
    map: true,
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :key, 1, type: :string
  field :value, 2, type: Flyteidl2.Core.LiteralType
end

defmodule Flyteidl2.Core.TypeStructure do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.core.TypeStructure",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :tag, 1, type: :string

  field :dataclass_type, 2,
    repeated: true,
    type: Flyteidl2.Core.TypeStructure.DataclassTypeEntry,
    json_name: "dataclassType",
    map: true
end

defmodule Flyteidl2.Core.TypeAnnotation do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.core.TypeAnnotation",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :annotations, 1, type: Google.Protobuf.Struct
end

defmodule Flyteidl2.Core.LiteralType do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.core.LiteralType",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  oneof :type, 0

  field :simple, 1, type: Flyteidl2.Core.SimpleType, enum: true, oneof: 0
  field :schema, 2, type: Flyteidl2.Core.SchemaType, oneof: 0

  field :collection_type, 3,
    type: Flyteidl2.Core.LiteralType,
    json_name: "collectionType",
    oneof: 0

  field :map_value_type, 4, type: Flyteidl2.Core.LiteralType, json_name: "mapValueType", oneof: 0
  field :blob, 5, type: Flyteidl2.Core.BlobType, oneof: 0
  field :enum_type, 7, type: Flyteidl2.Core.EnumType, json_name: "enumType", oneof: 0

  field :structured_dataset_type, 8,
    type: Flyteidl2.Core.StructuredDatasetType,
    json_name: "structuredDatasetType",
    oneof: 0

  field :union_type, 10, type: Flyteidl2.Core.UnionType, json_name: "unionType", oneof: 0
  field :metadata, 6, type: Google.Protobuf.Struct
  field :annotation, 9, type: Flyteidl2.Core.TypeAnnotation
  field :structure, 11, type: Flyteidl2.Core.TypeStructure
end

defmodule Flyteidl2.Core.OutputReference do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.core.OutputReference",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :node_id, 1, type: :string, json_name: "nodeId"
  field :var, 2, type: :string

  field :attr_path, 3,
    repeated: true,
    type: Flyteidl2.Core.PromiseAttribute,
    json_name: "attrPath"
end

defmodule Flyteidl2.Core.PromiseAttribute do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.core.PromiseAttribute",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  oneof :value, 0

  field :string_value, 1, type: :string, json_name: "stringValue", oneof: 0
  field :int_value, 2, type: :int32, json_name: "intValue", oneof: 0
end

defmodule Flyteidl2.Core.Error do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.core.Error",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :failed_node_id, 1, type: :string, json_name: "failedNodeId"
  field :message, 2, type: :string
end
