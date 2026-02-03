defmodule Flyteidl2.Auth.GetOAuth2MetadataRequest do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.auth.GetOAuth2MetadataRequest",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3
end

defmodule Flyteidl2.Auth.GetOAuth2MetadataResponse do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.auth.GetOAuth2MetadataResponse",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :issuer, 1, type: :string
  field :authorization_endpoint, 2, type: :string, json_name: "authorizationEndpoint"
  field :token_endpoint, 3, type: :string, json_name: "tokenEndpoint"

  field :response_types_supported, 4,
    repeated: true,
    type: :string,
    json_name: "responseTypesSupported"

  field :scopes_supported, 5, repeated: true, type: :string, json_name: "scopesSupported"

  field :token_endpoint_auth_methods_supported, 6,
    repeated: true,
    type: :string,
    json_name: "tokenEndpointAuthMethodsSupported"

  field :jwks_uri, 7, type: :string, json_name: "jwksUri"

  field :code_challenge_methods_supported, 8,
    repeated: true,
    type: :string,
    json_name: "codeChallengeMethodsSupported"

  field :grant_types_supported, 9, repeated: true, type: :string, json_name: "grantTypesSupported"

  field :device_authorization_endpoint, 10,
    type: :string,
    json_name: "deviceAuthorizationEndpoint"
end

defmodule Flyteidl2.Auth.GetPublicClientConfigRequest do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.auth.GetPublicClientConfigRequest",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3
end

defmodule Flyteidl2.Auth.GetPublicClientConfigResponse do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.auth.GetPublicClientConfigResponse",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :client_id, 1, type: :string, json_name: "clientId"
  field :redirect_uri, 2, type: :string, json_name: "redirectUri"
  field :scopes, 3, repeated: true, type: :string
  field :authorization_metadata_key, 4, type: :string, json_name: "authorizationMetadataKey"
  field :service_http_endpoint, 5, type: :string, json_name: "serviceHttpEndpoint"
  field :audience, 6, type: :string
end

defmodule Flyteidl2.Auth.AuthMetadataService.Service do
  @moduledoc false

  use GRPC.Service,
    name: "flyteidl2.auth.AuthMetadataService",
    protoc_gen_elixir_version: "0.16.0"

  rpc :GetOAuth2Metadata,
      Flyteidl2.Auth.GetOAuth2MetadataRequest,
      Flyteidl2.Auth.GetOAuth2MetadataResponse

  rpc :GetPublicClientConfig,
      Flyteidl2.Auth.GetPublicClientConfigRequest,
      Flyteidl2.Auth.GetPublicClientConfigResponse
end

defmodule Flyteidl2.Auth.AuthMetadataService.Stub do
  @moduledoc false

  use GRPC.Stub, service: Flyteidl2.Auth.AuthMetadataService.Service
end
