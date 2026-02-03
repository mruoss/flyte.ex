defmodule Flyteidl2.Cacheservice.KeyMapMetadata.ValuesEntry do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.cacheservice.KeyMapMetadata.ValuesEntry",
    map: true,
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :key, 1, type: :string
  field :value, 2, type: :string
end

defmodule Flyteidl2.Cacheservice.KeyMapMetadata do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.cacheservice.KeyMapMetadata",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :values, 1,
    repeated: true,
    type: Flyteidl2.Cacheservice.KeyMapMetadata.ValuesEntry,
    map: true
end

defmodule Flyteidl2.Cacheservice.Metadata do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.cacheservice.Metadata",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :source_identifier, 1, type: Flyteidl2.Core.Identifier, json_name: "sourceIdentifier"
  field :key_map, 2, type: Flyteidl2.Cacheservice.KeyMapMetadata, json_name: "keyMap"
  field :created_at, 3, type: Google.Protobuf.Timestamp, json_name: "createdAt"
  field :last_updated_at, 4, type: Google.Protobuf.Timestamp, json_name: "lastUpdatedAt"
end

defmodule Flyteidl2.Cacheservice.CachedOutput do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.cacheservice.CachedOutput",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  oneof :output, 0

  field :output_literals, 1,
    type: Flyteidl2.Core.LiteralMap,
    json_name: "outputLiterals",
    oneof: 0

  field :output_uri, 2, type: :string, json_name: "outputUri", oneof: 0
  field :metadata, 3, type: Flyteidl2.Cacheservice.Metadata
end

defmodule Flyteidl2.Cacheservice.GetCacheRequest do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.cacheservice.GetCacheRequest",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :key, 1, type: :string
end

defmodule Flyteidl2.Cacheservice.GetCacheResponse do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.cacheservice.GetCacheResponse",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :output, 1, type: Flyteidl2.Cacheservice.CachedOutput
end

defmodule Flyteidl2.Cacheservice.OverwriteOutput do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.cacheservice.OverwriteOutput",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :overwrite, 1, type: :bool
  field :delete_blob, 2, type: :bool, json_name: "deleteBlob"
  field :max_age, 3, type: Google.Protobuf.Duration, json_name: "maxAge"
end

defmodule Flyteidl2.Cacheservice.PutCacheRequest do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.cacheservice.PutCacheRequest",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :key, 1, type: :string
  field :output, 2, type: Flyteidl2.Cacheservice.CachedOutput
  field :overwrite, 3, type: Flyteidl2.Cacheservice.OverwriteOutput
end

defmodule Flyteidl2.Cacheservice.PutCacheResponse do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.cacheservice.PutCacheResponse",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3
end

defmodule Flyteidl2.Cacheservice.DeleteCacheRequest do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.cacheservice.DeleteCacheRequest",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :key, 1, type: :string
end

defmodule Flyteidl2.Cacheservice.DeleteCacheResponse do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.cacheservice.DeleteCacheResponse",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3
end

defmodule Flyteidl2.Cacheservice.Reservation do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.cacheservice.Reservation",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :key, 1, type: :string
  field :owner_id, 2, type: :string, json_name: "ownerId"
  field :heartbeat_interval, 3, type: Google.Protobuf.Duration, json_name: "heartbeatInterval"
  field :expires_at, 4, type: Google.Protobuf.Timestamp, json_name: "expiresAt"
end

defmodule Flyteidl2.Cacheservice.GetOrExtendReservationRequest do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.cacheservice.GetOrExtendReservationRequest",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :key, 1, type: :string
  field :owner_id, 2, type: :string, json_name: "ownerId"
  field :heartbeat_interval, 3, type: Google.Protobuf.Duration, json_name: "heartbeatInterval"
end

defmodule Flyteidl2.Cacheservice.GetOrExtendReservationResponse do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.cacheservice.GetOrExtendReservationResponse",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :reservation, 1, type: Flyteidl2.Cacheservice.Reservation
end

defmodule Flyteidl2.Cacheservice.ReleaseReservationRequest do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.cacheservice.ReleaseReservationRequest",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :key, 1, type: :string
  field :owner_id, 2, type: :string, json_name: "ownerId"
end

defmodule Flyteidl2.Cacheservice.ReleaseReservationResponse do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.cacheservice.ReleaseReservationResponse",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3
end

defmodule Flyteidl2.Cacheservice.CacheService.Service do
  @moduledoc false

  use GRPC.Service,
    name: "flyteidl2.cacheservice.CacheService",
    protoc_gen_elixir_version: "0.16.0"

  rpc :Get, Flyteidl2.Cacheservice.GetCacheRequest, Flyteidl2.Cacheservice.GetCacheResponse

  rpc :Put, Flyteidl2.Cacheservice.PutCacheRequest, Flyteidl2.Cacheservice.PutCacheResponse

  rpc :Delete,
      Flyteidl2.Cacheservice.DeleteCacheRequest,
      Flyteidl2.Cacheservice.DeleteCacheResponse

  rpc :GetOrExtendReservation,
      Flyteidl2.Cacheservice.GetOrExtendReservationRequest,
      Flyteidl2.Cacheservice.GetOrExtendReservationResponse

  rpc :ReleaseReservation,
      Flyteidl2.Cacheservice.ReleaseReservationRequest,
      Flyteidl2.Cacheservice.ReleaseReservationResponse
end

defmodule Flyteidl2.Cacheservice.CacheService.Stub do
  @moduledoc false

  use GRPC.Stub, service: Flyteidl2.Cacheservice.CacheService.Service
end
