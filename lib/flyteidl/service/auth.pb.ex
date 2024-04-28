defmodule Flyteidl.Service.OAuth2MetadataRequest do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"
end

defmodule Flyteidl.Service.OAuth2MetadataResponse do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

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

defmodule Flyteidl.Service.PublicClientAuthConfigRequest do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"
end

defmodule Flyteidl.Service.PublicClientAuthConfigResponse do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :client_id, 1, type: :string, json_name: "clientId"
  field :redirect_uri, 2, type: :string, json_name: "redirectUri"
  field :scopes, 3, repeated: true, type: :string
  field :authorization_metadata_key, 4, type: :string, json_name: "authorizationMetadataKey"
  field :service_http_endpoint, 5, type: :string, json_name: "serviceHttpEndpoint"
  field :audience, 6, type: :string
end

defmodule Flyteidl.Service.AuthMetadataService.Service do
  @moduledoc false

  use GRPC.Service,
    name: "flyteidl.service.AuthMetadataService",
    protoc_gen_elixir_version: "0.12.0"

  rpc :GetOAuth2Metadata,
      Flyteidl.Service.OAuth2MetadataRequest,
      Flyteidl.Service.OAuth2MetadataResponse

  rpc :GetPublicClientConfig,
      Flyteidl.Service.PublicClientAuthConfigRequest,
      Flyteidl.Service.PublicClientAuthConfigResponse
end

defmodule Flyteidl.Service.AuthMetadataService.Stub do
  @moduledoc false

  use GRPC.Stub, service: Flyteidl.Service.AuthMetadataService.Service
end