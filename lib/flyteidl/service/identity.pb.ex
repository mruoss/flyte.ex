defmodule Flyteidl.Service.UserInfoRequest do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"
end

defmodule Flyteidl.Service.UserInfoResponse do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :subject, 1, type: :string
  field :name, 2, type: :string
  field :preferred_username, 3, type: :string, json_name: "preferredUsername"
  field :given_name, 4, type: :string, json_name: "givenName"
  field :family_name, 5, type: :string, json_name: "familyName"
  field :email, 6, type: :string
  field :picture, 7, type: :string
  field :additional_claims, 8, type: Google.Protobuf.Struct, json_name: "additionalClaims"
end

defmodule Flyteidl.Service.IdentityService.Service do
  @moduledoc false

  use GRPC.Service, name: "flyteidl.service.IdentityService", protoc_gen_elixir_version: "0.12.0"

  rpc :UserInfo, Flyteidl.Service.UserInfoRequest, Flyteidl.Service.UserInfoResponse
end

defmodule Flyteidl.Service.IdentityService.Stub do
  @moduledoc false

  use GRPC.Stub, service: Flyteidl.Service.IdentityService.Service
end