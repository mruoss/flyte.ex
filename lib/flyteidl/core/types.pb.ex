defmodule Flyteidl.Core.SimpleType do
  @moduledoc false

  use Protobuf, enum: true, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

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

defmodule Flyteidl.Core.SchemaType.SchemaColumn.SchemaColumnType do
  @moduledoc false

  use Protobuf, enum: true, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :INTEGER, 0
  field :FLOAT, 1
  field :STRING, 2
  field :BOOLEAN, 3
  field :DATETIME, 4
  field :DURATION, 5
end

defmodule Flyteidl.Core.BlobType.BlobDimensionality do
  @moduledoc false

  use Protobuf, enum: true, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :SINGLE, 0
  field :MULTIPART, 1
end

defmodule Flyteidl.Core.SchemaType.SchemaColumn do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :name, 1, type: :string
  field :type, 2, type: Flyteidl.Core.SchemaType.SchemaColumn.SchemaColumnType, enum: true
end

defmodule Flyteidl.Core.SchemaType do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :columns, 3, repeated: true, type: Flyteidl.Core.SchemaType.SchemaColumn
end

defmodule Flyteidl.Core.StructuredDatasetType.DatasetColumn do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :name, 1, type: :string
  field :literal_type, 2, type: Flyteidl.Core.LiteralType, json_name: "literalType"
end

defmodule Flyteidl.Core.StructuredDatasetType do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :columns, 1, repeated: true, type: Flyteidl.Core.StructuredDatasetType.DatasetColumn
  field :format, 2, type: :string
  field :external_schema_type, 3, type: :string, json_name: "externalSchemaType"
  field :external_schema_bytes, 4, type: :bytes, json_name: "externalSchemaBytes"
end

defmodule Flyteidl.Core.BlobType do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :format, 1, type: :string
  field :dimensionality, 2, type: Flyteidl.Core.BlobType.BlobDimensionality, enum: true
end

defmodule Flyteidl.Core.EnumType do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :values, 1, repeated: true, type: :string
end

defmodule Flyteidl.Core.UnionType do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :variants, 1, repeated: true, type: Flyteidl.Core.LiteralType
end

defmodule Flyteidl.Core.TypeStructure do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :tag, 1, type: :string
end

defmodule Flyteidl.Core.TypeAnnotation do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :annotations, 1, type: Google.Protobuf.Struct
end

defmodule Flyteidl.Core.LiteralType do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  oneof :type, 0

  field :simple, 1, type: Flyteidl.Core.SimpleType, enum: true, oneof: 0
  field :schema, 2, type: Flyteidl.Core.SchemaType, oneof: 0

  field :collection_type, 3,
    type: Flyteidl.Core.LiteralType,
    json_name: "collectionType",
    oneof: 0

  field :map_value_type, 4, type: Flyteidl.Core.LiteralType, json_name: "mapValueType", oneof: 0
  field :blob, 5, type: Flyteidl.Core.BlobType, oneof: 0
  field :enum_type, 7, type: Flyteidl.Core.EnumType, json_name: "enumType", oneof: 0

  field :structured_dataset_type, 8,
    type: Flyteidl.Core.StructuredDatasetType,
    json_name: "structuredDatasetType",
    oneof: 0

  field :union_type, 10, type: Flyteidl.Core.UnionType, json_name: "unionType", oneof: 0
  field :metadata, 6, type: Google.Protobuf.Struct
  field :annotation, 9, type: Flyteidl.Core.TypeAnnotation
  field :structure, 11, type: Flyteidl.Core.TypeStructure
end

defmodule Flyteidl.Core.OutputReference do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :node_id, 1, type: :string, json_name: "nodeId"
  field :var, 2, type: :string
  field :attr_path, 3, repeated: true, type: Flyteidl.Core.PromiseAttribute, json_name: "attrPath"
end

defmodule Flyteidl.Core.PromiseAttribute do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  oneof :value, 0

  field :string_value, 1, type: :string, json_name: "stringValue", oneof: 0
  field :int_value, 2, type: :int32, json_name: "intValue", oneof: 0
end

defmodule Flyteidl.Core.Error do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :failed_node_id, 1, type: :string, json_name: "failedNodeId"
  field :message, 2, type: :string
end