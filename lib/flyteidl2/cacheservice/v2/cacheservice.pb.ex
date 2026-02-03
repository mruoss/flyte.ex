defmodule Flyteidl2.Cacheservice.V2.Identifier do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.cacheservice.v2.Identifier",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :org, 1, type: :string, deprecated: false
  field :project, 2, type: :string, deprecated: false
  field :domain, 3, type: :string, deprecated: false
end

defmodule Flyteidl2.Cacheservice.V2.GetCacheRequest do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.cacheservice.v2.GetCacheRequest",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :base_request, 1, type: Flyteidl2.Cacheservice.GetCacheRequest, json_name: "baseRequest"
  field :identifier, 2, type: Flyteidl2.Cacheservice.V2.Identifier, deprecated: false
end

defmodule Flyteidl2.Cacheservice.V2.PutCacheRequest do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.cacheservice.v2.PutCacheRequest",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :base_request, 1, type: Flyteidl2.Cacheservice.PutCacheRequest, json_name: "baseRequest"
  field :identifier, 2, type: Flyteidl2.Cacheservice.V2.Identifier, deprecated: false
end

defmodule Flyteidl2.Cacheservice.V2.DeleteCacheRequest do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.cacheservice.v2.DeleteCacheRequest",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :base_request, 1,
    type: Flyteidl2.Cacheservice.DeleteCacheRequest,
    json_name: "baseRequest"

  field :identifier, 2, type: Flyteidl2.Cacheservice.V2.Identifier, deprecated: false
end

defmodule Flyteidl2.Cacheservice.V2.GetOrExtendReservationRequest do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.cacheservice.v2.GetOrExtendReservationRequest",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :base_request, 1,
    type: Flyteidl2.Cacheservice.GetOrExtendReservationRequest,
    json_name: "baseRequest"

  field :identifier, 2, type: Flyteidl2.Cacheservice.V2.Identifier, deprecated: false
end

defmodule Flyteidl2.Cacheservice.V2.ReleaseReservationRequest do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.cacheservice.v2.ReleaseReservationRequest",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :base_request, 1,
    type: Flyteidl2.Cacheservice.ReleaseReservationRequest,
    json_name: "baseRequest"

  field :identifier, 2, type: Flyteidl2.Cacheservice.V2.Identifier, deprecated: false
end

defmodule Flyteidl2.Cacheservice.V2.CacheService.Service do
  @moduledoc false

  use GRPC.Service,
    name: "flyteidl2.cacheservice.v2.CacheService",
    protoc_gen_elixir_version: "0.16.0"

  rpc :Get, Flyteidl2.Cacheservice.V2.GetCacheRequest, Flyteidl2.Cacheservice.GetCacheResponse

  rpc :Put, Flyteidl2.Cacheservice.V2.PutCacheRequest, Flyteidl2.Cacheservice.PutCacheResponse

  rpc :Delete,
      Flyteidl2.Cacheservice.V2.DeleteCacheRequest,
      Flyteidl2.Cacheservice.DeleteCacheResponse

  rpc :GetOrExtendReservation,
      Flyteidl2.Cacheservice.V2.GetOrExtendReservationRequest,
      Flyteidl2.Cacheservice.GetOrExtendReservationResponse

  rpc :ReleaseReservation,
      Flyteidl2.Cacheservice.V2.ReleaseReservationRequest,
      Flyteidl2.Cacheservice.ReleaseReservationResponse
end

defmodule Flyteidl2.Cacheservice.V2.CacheService.Stub do
  @moduledoc false

  use GRPC.Stub, service: Flyteidl2.Cacheservice.V2.CacheService.Service
end
