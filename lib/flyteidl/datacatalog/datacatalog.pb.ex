defmodule Datacatalog.SinglePropertyFilter.ComparisonOperator do
  @moduledoc false

  use Protobuf, enum: true, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :EQUALS, 0
end

defmodule Datacatalog.PaginationOptions.SortOrder do
  @moduledoc false

  use Protobuf, enum: true, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :DESCENDING, 0
  field :ASCENDING, 1
end

defmodule Datacatalog.PaginationOptions.SortKey do
  @moduledoc false

  use Protobuf, enum: true, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :CREATION_TIME, 0
end

defmodule Datacatalog.CreateDatasetRequest do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :dataset, 1, type: Datacatalog.Dataset
end

defmodule Datacatalog.CreateDatasetResponse do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"
end

defmodule Datacatalog.GetDatasetRequest do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :dataset, 1, type: Datacatalog.DatasetID
end

defmodule Datacatalog.GetDatasetResponse do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :dataset, 1, type: Datacatalog.Dataset
end

defmodule Datacatalog.GetArtifactRequest do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  oneof :query_handle, 0

  field :dataset, 1, type: Datacatalog.DatasetID
  field :artifact_id, 2, type: :string, json_name: "artifactId", oneof: 0
  field :tag_name, 3, type: :string, json_name: "tagName", oneof: 0
end

defmodule Datacatalog.GetArtifactResponse do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :artifact, 1, type: Datacatalog.Artifact
end

defmodule Datacatalog.CreateArtifactRequest do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :artifact, 1, type: Datacatalog.Artifact
end

defmodule Datacatalog.CreateArtifactResponse do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"
end

defmodule Datacatalog.AddTagRequest do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :tag, 1, type: Datacatalog.Tag
end

defmodule Datacatalog.AddTagResponse do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"
end

defmodule Datacatalog.ListArtifactsRequest do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :dataset, 1, type: Datacatalog.DatasetID
  field :filter, 2, type: Datacatalog.FilterExpression
  field :pagination, 3, type: Datacatalog.PaginationOptions
end

defmodule Datacatalog.ListArtifactsResponse do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :artifacts, 1, repeated: true, type: Datacatalog.Artifact
  field :next_token, 2, type: :string, json_name: "nextToken"
end

defmodule Datacatalog.ListDatasetsRequest do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :filter, 1, type: Datacatalog.FilterExpression
  field :pagination, 2, type: Datacatalog.PaginationOptions
end

defmodule Datacatalog.ListDatasetsResponse do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :datasets, 1, repeated: true, type: Datacatalog.Dataset
  field :next_token, 2, type: :string, json_name: "nextToken"
end

defmodule Datacatalog.UpdateArtifactRequest do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  oneof :query_handle, 0

  field :dataset, 1, type: Datacatalog.DatasetID
  field :artifact_id, 2, type: :string, json_name: "artifactId", oneof: 0
  field :tag_name, 3, type: :string, json_name: "tagName", oneof: 0
  field :data, 4, repeated: true, type: Datacatalog.ArtifactData
end

defmodule Datacatalog.UpdateArtifactResponse do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :artifact_id, 1, type: :string, json_name: "artifactId"
end

defmodule Datacatalog.ReservationID do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :dataset_id, 1, type: Datacatalog.DatasetID, json_name: "datasetId"
  field :tag_name, 2, type: :string, json_name: "tagName"
end

defmodule Datacatalog.GetOrExtendReservationRequest do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :reservation_id, 1, type: Datacatalog.ReservationID, json_name: "reservationId"
  field :owner_id, 2, type: :string, json_name: "ownerId"
  field :heartbeat_interval, 3, type: Google.Protobuf.Duration, json_name: "heartbeatInterval"
end

defmodule Datacatalog.Reservation do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :reservation_id, 1, type: Datacatalog.ReservationID, json_name: "reservationId"
  field :owner_id, 2, type: :string, json_name: "ownerId"
  field :heartbeat_interval, 3, type: Google.Protobuf.Duration, json_name: "heartbeatInterval"
  field :expires_at, 4, type: Google.Protobuf.Timestamp, json_name: "expiresAt"
  field :metadata, 6, type: Datacatalog.Metadata
end

defmodule Datacatalog.GetOrExtendReservationResponse do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :reservation, 1, type: Datacatalog.Reservation
end

defmodule Datacatalog.ReleaseReservationRequest do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :reservation_id, 1, type: Datacatalog.ReservationID, json_name: "reservationId"
  field :owner_id, 2, type: :string, json_name: "ownerId"
end

defmodule Datacatalog.ReleaseReservationResponse do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"
end

defmodule Datacatalog.Dataset do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :id, 1, type: Datacatalog.DatasetID
  field :metadata, 2, type: Datacatalog.Metadata
  field :partitionKeys, 3, repeated: true, type: :string
end

defmodule Datacatalog.Partition do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :key, 1, type: :string
  field :value, 2, type: :string
end

defmodule Datacatalog.DatasetID do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :project, 1, type: :string
  field :name, 2, type: :string
  field :domain, 3, type: :string
  field :version, 4, type: :string
  field :UUID, 5, type: :string
end

defmodule Datacatalog.Artifact do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :id, 1, type: :string
  field :dataset, 2, type: Datacatalog.DatasetID
  field :data, 3, repeated: true, type: Datacatalog.ArtifactData
  field :metadata, 4, type: Datacatalog.Metadata
  field :partitions, 5, repeated: true, type: Datacatalog.Partition
  field :tags, 6, repeated: true, type: Datacatalog.Tag
  field :created_at, 7, type: Google.Protobuf.Timestamp, json_name: "createdAt"
end

defmodule Datacatalog.ArtifactData do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :name, 1, type: :string
  field :value, 2, type: Flyteidl.Core.Literal
end

defmodule Datacatalog.Tag do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :name, 1, type: :string
  field :artifact_id, 2, type: :string, json_name: "artifactId"
  field :dataset, 3, type: Datacatalog.DatasetID
end

defmodule Datacatalog.Metadata.KeyMapEntry do
  @moduledoc false

  use Protobuf, map: true, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :key, 1, type: :string
  field :value, 2, type: :string
end

defmodule Datacatalog.Metadata do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :key_map, 1,
    repeated: true,
    type: Datacatalog.Metadata.KeyMapEntry,
    json_name: "keyMap",
    map: true
end

defmodule Datacatalog.FilterExpression do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :filters, 1, repeated: true, type: Datacatalog.SinglePropertyFilter
end

defmodule Datacatalog.SinglePropertyFilter do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  oneof :property_filter, 0

  field :tag_filter, 1, type: Datacatalog.TagPropertyFilter, json_name: "tagFilter", oneof: 0

  field :partition_filter, 2,
    type: Datacatalog.PartitionPropertyFilter,
    json_name: "partitionFilter",
    oneof: 0

  field :artifact_filter, 3,
    type: Datacatalog.ArtifactPropertyFilter,
    json_name: "artifactFilter",
    oneof: 0

  field :dataset_filter, 4,
    type: Datacatalog.DatasetPropertyFilter,
    json_name: "datasetFilter",
    oneof: 0

  field :operator, 10, type: Datacatalog.SinglePropertyFilter.ComparisonOperator, enum: true
end

defmodule Datacatalog.ArtifactPropertyFilter do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  oneof :property, 0

  field :artifact_id, 1, type: :string, json_name: "artifactId", oneof: 0
end

defmodule Datacatalog.TagPropertyFilter do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  oneof :property, 0

  field :tag_name, 1, type: :string, json_name: "tagName", oneof: 0
end

defmodule Datacatalog.PartitionPropertyFilter do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  oneof :property, 0

  field :key_val, 1, type: Datacatalog.KeyValuePair, json_name: "keyVal", oneof: 0
end

defmodule Datacatalog.KeyValuePair do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :key, 1, type: :string
  field :value, 2, type: :string
end

defmodule Datacatalog.DatasetPropertyFilter do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  oneof :property, 0

  field :project, 1, type: :string, oneof: 0
  field :name, 2, type: :string, oneof: 0
  field :domain, 3, type: :string, oneof: 0
  field :version, 4, type: :string, oneof: 0
end

defmodule Datacatalog.PaginationOptions do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :limit, 1, type: :uint32
  field :token, 2, type: :string
  field :sortKey, 3, type: Datacatalog.PaginationOptions.SortKey, enum: true
  field :sortOrder, 4, type: Datacatalog.PaginationOptions.SortOrder, enum: true
end

defmodule Datacatalog.DataCatalog.Service do
  @moduledoc false

  use GRPC.Service, name: "datacatalog.DataCatalog", protoc_gen_elixir_version: "0.12.0"

  rpc :CreateDataset, Datacatalog.CreateDatasetRequest, Datacatalog.CreateDatasetResponse

  rpc :GetDataset, Datacatalog.GetDatasetRequest, Datacatalog.GetDatasetResponse

  rpc :CreateArtifact, Datacatalog.CreateArtifactRequest, Datacatalog.CreateArtifactResponse

  rpc :GetArtifact, Datacatalog.GetArtifactRequest, Datacatalog.GetArtifactResponse

  rpc :AddTag, Datacatalog.AddTagRequest, Datacatalog.AddTagResponse

  rpc :ListArtifacts, Datacatalog.ListArtifactsRequest, Datacatalog.ListArtifactsResponse

  rpc :ListDatasets, Datacatalog.ListDatasetsRequest, Datacatalog.ListDatasetsResponse

  rpc :UpdateArtifact, Datacatalog.UpdateArtifactRequest, Datacatalog.UpdateArtifactResponse

  rpc :GetOrExtendReservation,
      Datacatalog.GetOrExtendReservationRequest,
      Datacatalog.GetOrExtendReservationResponse

  rpc :ReleaseReservation,
      Datacatalog.ReleaseReservationRequest,
      Datacatalog.ReleaseReservationResponse
end

defmodule Datacatalog.DataCatalog.Stub do
  @moduledoc false

  use GRPC.Stub, service: Datacatalog.DataCatalog.Service
end