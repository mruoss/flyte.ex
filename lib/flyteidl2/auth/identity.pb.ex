defmodule Flyteidl2.Auth.UserInfoRequest do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.auth.UserInfoRequest",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3
end

defmodule Flyteidl2.Auth.UserInfoResponse do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.auth.UserInfoResponse",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :subject, 1, type: :string
  field :name, 2, type: :string
  field :preferred_username, 3, type: :string, json_name: "preferredUsername"
  field :given_name, 4, type: :string, json_name: "givenName"
  field :family_name, 5, type: :string, json_name: "familyName"
  field :email, 6, type: :string
  field :picture, 7, type: :string
  field :additional_claims, 8, type: Google.Protobuf.Struct, json_name: "additionalClaims"
end

defmodule Flyteidl2.Auth.IdentityService.Service do
  @moduledoc false

  use GRPC.Service, name: "flyteidl2.auth.IdentityService", protoc_gen_elixir_version: "0.16.0"

  rpc :UserInfo, Flyteidl2.Auth.UserInfoRequest, Flyteidl2.Auth.UserInfoResponse
end

defmodule Flyteidl2.Auth.IdentityService.Stub do
  @moduledoc false

  use GRPC.Stub, service: Flyteidl2.Auth.IdentityService.Service
end
