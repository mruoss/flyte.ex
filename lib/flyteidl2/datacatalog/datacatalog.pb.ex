defmodule Flyteidl2.Datacatalog.SinglePropertyFilter.ComparisonOperator do
  @moduledoc false

  use Protobuf, enum: true, protoc_gen_elixir_version: "0.15.0", syntax: :proto3

  field :EQUALS, 0
end

defmodule Flyteidl2.Datacatalog.PaginationOptions.SortOrder do
  @moduledoc false

  use Protobuf, enum: true, protoc_gen_elixir_version: "0.15.0", syntax: :proto3

  field :DESCENDING, 0
  field :ASCENDING, 1
end

defmodule Flyteidl2.Datacatalog.PaginationOptions.SortKey do
  @moduledoc false

  use Protobuf, enum: true, protoc_gen_elixir_version: "0.15.0", syntax: :proto3

  field :CREATION_TIME, 0
end

defmodule Flyteidl2.Datacatalog.CreateDatasetRequest do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.15.0", syntax: :proto3

  field :dataset, 1, type: Flyteidl2.Datacatalog.Dataset
end

defmodule Flyteidl2.Datacatalog.CreateDatasetResponse do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.15.0", syntax: :proto3
end

defmodule Flyteidl2.Datacatalog.GetDatasetRequest do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.15.0", syntax: :proto3

  field :dataset, 1, type: Flyteidl2.Datacatalog.DatasetID
end

defmodule Flyteidl2.Datacatalog.GetDatasetResponse do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.15.0", syntax: :proto3

  field :dataset, 1, type: Flyteidl2.Datacatalog.Dataset
end

defmodule Flyteidl2.Datacatalog.GetArtifactRequest do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.15.0", syntax: :proto3

  oneof :query_handle, 0

  field :dataset, 1, type: Flyteidl2.Datacatalog.DatasetID
  field :artifact_id, 2, type: :string, json_name: "artifactId", oneof: 0
  field :tag_name, 3, type: :string, json_name: "tagName", oneof: 0
end

defmodule Flyteidl2.Datacatalog.GetArtifactResponse do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.15.0", syntax: :proto3

  field :artifact, 1, type: Flyteidl2.Datacatalog.Artifact
end

defmodule Flyteidl2.Datacatalog.CreateArtifactRequest do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.15.0", syntax: :proto3

  field :artifact, 1, type: Flyteidl2.Datacatalog.Artifact
end

defmodule Flyteidl2.Datacatalog.CreateArtifactResponse do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.15.0", syntax: :proto3
end

defmodule Flyteidl2.Datacatalog.AddTagRequest do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.15.0", syntax: :proto3

  field :tag, 1, type: Flyteidl2.Datacatalog.Tag
end

defmodule Flyteidl2.Datacatalog.AddTagResponse do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.15.0", syntax: :proto3
end

defmodule Flyteidl2.Datacatalog.ListArtifactsRequest do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.15.0", syntax: :proto3

  field :dataset, 1, type: Flyteidl2.Datacatalog.DatasetID
  field :filter, 2, type: Flyteidl2.Datacatalog.FilterExpression
  field :pagination, 3, type: Flyteidl2.Datacatalog.PaginationOptions
end

defmodule Flyteidl2.Datacatalog.ListArtifactsResponse do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.15.0", syntax: :proto3

  field :artifacts, 1, repeated: true, type: Flyteidl2.Datacatalog.Artifact
  field :next_token, 2, type: :string, json_name: "nextToken"
end

defmodule Flyteidl2.Datacatalog.ListDatasetsRequest do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.15.0", syntax: :proto3

  field :filter, 1, type: Flyteidl2.Datacatalog.FilterExpression
  field :pagination, 2, type: Flyteidl2.Datacatalog.PaginationOptions
end

defmodule Flyteidl2.Datacatalog.ListDatasetsResponse do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.15.0", syntax: :proto3

  field :datasets, 1, repeated: true, type: Flyteidl2.Datacatalog.Dataset
  field :next_token, 2, type: :string, json_name: "nextToken"
end

defmodule Flyteidl2.Datacatalog.UpdateArtifactRequest do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.15.0", syntax: :proto3

  oneof :query_handle, 0

  field :dataset, 1, type: Flyteidl2.Datacatalog.DatasetID
  field :artifact_id, 2, type: :string, json_name: "artifactId", oneof: 0
  field :tag_name, 3, type: :string, json_name: "tagName", oneof: 0
  field :data, 4, repeated: true, type: Flyteidl2.Datacatalog.ArtifactData
  field :metadata, 5, type: Flyteidl2.Datacatalog.Metadata
end

defmodule Flyteidl2.Datacatalog.UpdateArtifactResponse do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.15.0", syntax: :proto3

  field :artifact_id, 1, type: :string, json_name: "artifactId"
end

defmodule Flyteidl2.Datacatalog.ReservationID do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.15.0", syntax: :proto3

  field :dataset_id, 1, type: Flyteidl2.Datacatalog.DatasetID, json_name: "datasetId"
  field :tag_name, 2, type: :string, json_name: "tagName"
end

defmodule Flyteidl2.Datacatalog.GetOrExtendReservationRequest do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.15.0", syntax: :proto3

  field :reservation_id, 1, type: Flyteidl2.Datacatalog.ReservationID, json_name: "reservationId"
  field :owner_id, 2, type: :string, json_name: "ownerId"
  field :heartbeat_interval, 3, type: Google.Protobuf.Duration, json_name: "heartbeatInterval"
end

defmodule Flyteidl2.Datacatalog.Reservation do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.15.0", syntax: :proto3

  field :reservation_id, 1, type: Flyteidl2.Datacatalog.ReservationID, json_name: "reservationId"
  field :owner_id, 2, type: :string, json_name: "ownerId"
  field :heartbeat_interval, 3, type: Google.Protobuf.Duration, json_name: "heartbeatInterval"
  field :expires_at, 4, type: Google.Protobuf.Timestamp, json_name: "expiresAt"
  field :metadata, 6, type: Flyteidl2.Datacatalog.Metadata
end

defmodule Flyteidl2.Datacatalog.GetOrExtendReservationResponse do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.15.0", syntax: :proto3

  field :reservation, 1, type: Flyteidl2.Datacatalog.Reservation
end

defmodule Flyteidl2.Datacatalog.ReleaseReservationRequest do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.15.0", syntax: :proto3

  field :reservation_id, 1, type: Flyteidl2.Datacatalog.ReservationID, json_name: "reservationId"
  field :owner_id, 2, type: :string, json_name: "ownerId"
end

defmodule Flyteidl2.Datacatalog.ReleaseReservationResponse do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.15.0", syntax: :proto3
end

defmodule Flyteidl2.Datacatalog.Dataset do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.15.0", syntax: :proto3

  field :id, 1, type: Flyteidl2.Datacatalog.DatasetID
  field :metadata, 2, type: Flyteidl2.Datacatalog.Metadata
  field :partitionKeys, 3, repeated: true, type: :string
end

defmodule Flyteidl2.Datacatalog.Partition do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.15.0", syntax: :proto3

  field :key, 1, type: :string
  field :value, 2, type: :string
end

defmodule Flyteidl2.Datacatalog.DatasetID do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.15.0", syntax: :proto3

  field :project, 1, type: :string
  field :name, 2, type: :string
  field :domain, 3, type: :string
  field :version, 4, type: :string
  field :UUID, 5, type: :string
  field :org, 6, type: :string
end

defmodule Flyteidl2.Datacatalog.Artifact do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.15.0", syntax: :proto3

  field :id, 1, type: :string
  field :dataset, 2, type: Flyteidl2.Datacatalog.DatasetID
  field :data, 3, repeated: true, type: Flyteidl2.Datacatalog.ArtifactData
  field :metadata, 4, type: Flyteidl2.Datacatalog.Metadata
  field :partitions, 5, repeated: true, type: Flyteidl2.Datacatalog.Partition
  field :tags, 6, repeated: true, type: Flyteidl2.Datacatalog.Tag
  field :created_at, 7, type: Google.Protobuf.Timestamp, json_name: "createdAt"
end

defmodule Flyteidl2.Datacatalog.ArtifactData do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.15.0", syntax: :proto3

  field :name, 1, type: :string
  field :value, 2, type: Flyteidl2.Core.Literal
end

defmodule Flyteidl2.Datacatalog.Tag do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.15.0", syntax: :proto3

  field :name, 1, type: :string
  field :artifact_id, 2, type: :string, json_name: "artifactId"
  field :dataset, 3, type: Flyteidl2.Datacatalog.DatasetID
end

defmodule Flyteidl2.Datacatalog.Metadata.KeyMapEntry do
  @moduledoc false

  use Protobuf, map: true, protoc_gen_elixir_version: "0.15.0", syntax: :proto3

  field :key, 1, type: :string
  field :value, 2, type: :string
end

defmodule Flyteidl2.Datacatalog.Metadata do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.15.0", syntax: :proto3

  field :key_map, 1,
    repeated: true,
    type: Flyteidl2.Datacatalog.Metadata.KeyMapEntry,
    json_name: "keyMap",
    map: true
end

defmodule Flyteidl2.Datacatalog.FilterExpression do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.15.0", syntax: :proto3

  field :filters, 1, repeated: true, type: Flyteidl2.Datacatalog.SinglePropertyFilter
end

defmodule Flyteidl2.Datacatalog.SinglePropertyFilter do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.15.0", syntax: :proto3

  oneof :property_filter, 0

  field :tag_filter, 1,
    type: Flyteidl2.Datacatalog.TagPropertyFilter,
    json_name: "tagFilter",
    oneof: 0

  field :partition_filter, 2,
    type: Flyteidl2.Datacatalog.PartitionPropertyFilter,
    json_name: "partitionFilter",
    oneof: 0

  field :artifact_filter, 3,
    type: Flyteidl2.Datacatalog.ArtifactPropertyFilter,
    json_name: "artifactFilter",
    oneof: 0

  field :dataset_filter, 4,
    type: Flyteidl2.Datacatalog.DatasetPropertyFilter,
    json_name: "datasetFilter",
    oneof: 0

  field :operator, 10,
    type: Flyteidl2.Datacatalog.SinglePropertyFilter.ComparisonOperator,
    enum: true
end

defmodule Flyteidl2.Datacatalog.ArtifactPropertyFilter do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.15.0", syntax: :proto3

  oneof :property, 0

  field :artifact_id, 1, type: :string, json_name: "artifactId", oneof: 0
end

defmodule Flyteidl2.Datacatalog.TagPropertyFilter do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.15.0", syntax: :proto3

  oneof :property, 0

  field :tag_name, 1, type: :string, json_name: "tagName", oneof: 0
end

defmodule Flyteidl2.Datacatalog.PartitionPropertyFilter do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.15.0", syntax: :proto3

  oneof :property, 0

  field :key_val, 1, type: Flyteidl2.Datacatalog.KeyValuePair, json_name: "keyVal", oneof: 0
end

defmodule Flyteidl2.Datacatalog.KeyValuePair do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.15.0", syntax: :proto3

  field :key, 1, type: :string
  field :value, 2, type: :string
end

defmodule Flyteidl2.Datacatalog.DatasetPropertyFilter do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.15.0", syntax: :proto3

  oneof :property, 0

  field :project, 1, type: :string, oneof: 0
  field :name, 2, type: :string, oneof: 0
  field :domain, 3, type: :string, oneof: 0
  field :version, 4, type: :string, oneof: 0
  field :org, 5, type: :string, oneof: 0
end

defmodule Flyteidl2.Datacatalog.PaginationOptions do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.15.0", syntax: :proto3

  field :limit, 1, type: :uint32
  field :token, 2, type: :string
  field :sortKey, 3, type: Flyteidl2.Datacatalog.PaginationOptions.SortKey, enum: true
  field :sortOrder, 4, type: Flyteidl2.Datacatalog.PaginationOptions.SortOrder, enum: true
end

defmodule Flyteidl2.Datacatalog.DataCatalog.Service do
  @moduledoc false

  use GRPC.Service, name: "flyteidl2.datacatalog.DataCatalog", protoc_gen_elixir_version: "0.15.0"

  rpc :CreateDataset,
      Flyteidl2.Datacatalog.CreateDatasetRequest,
      Flyteidl2.Datacatalog.CreateDatasetResponse

  rpc :GetDataset,
      Flyteidl2.Datacatalog.GetDatasetRequest,
      Flyteidl2.Datacatalog.GetDatasetResponse

  rpc :CreateArtifact,
      Flyteidl2.Datacatalog.CreateArtifactRequest,
      Flyteidl2.Datacatalog.CreateArtifactResponse

  rpc :GetArtifact,
      Flyteidl2.Datacatalog.GetArtifactRequest,
      Flyteidl2.Datacatalog.GetArtifactResponse

  rpc :AddTag, Flyteidl2.Datacatalog.AddTagRequest, Flyteidl2.Datacatalog.AddTagResponse

  rpc :ListArtifacts,
      Flyteidl2.Datacatalog.ListArtifactsRequest,
      Flyteidl2.Datacatalog.ListArtifactsResponse

  rpc :ListDatasets,
      Flyteidl2.Datacatalog.ListDatasetsRequest,
      Flyteidl2.Datacatalog.ListDatasetsResponse

  rpc :UpdateArtifact,
      Flyteidl2.Datacatalog.UpdateArtifactRequest,
      Flyteidl2.Datacatalog.UpdateArtifactResponse

  rpc :GetOrExtendReservation,
      Flyteidl2.Datacatalog.GetOrExtendReservationRequest,
      Flyteidl2.Datacatalog.GetOrExtendReservationResponse

  rpc :ReleaseReservation,
      Flyteidl2.Datacatalog.ReleaseReservationRequest,
      Flyteidl2.Datacatalog.ReleaseReservationResponse
end

defmodule Flyteidl2.Datacatalog.DataCatalog.Stub do
  @moduledoc false

  use GRPC.Stub, service: Flyteidl2.Datacatalog.DataCatalog.Service
end
