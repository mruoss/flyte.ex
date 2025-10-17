defmodule Flyteidl2.Core.Secret.MountType do
  @moduledoc false

  use Protobuf, enum: true, protoc_gen_elixir_version: "0.15.0", syntax: :proto3

  field :ANY, 0
  field :ENV_VAR, 1
  field :FILE, 2
end

defmodule Flyteidl2.Core.OAuth2TokenRequest.Type do
  @moduledoc false

  use Protobuf, enum: true, protoc_gen_elixir_version: "0.15.0", syntax: :proto3

  field :CLIENT_CREDENTIALS, 0
end

defmodule Flyteidl2.Core.Secret do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.15.0", syntax: :proto3

  field :group, 1, type: :string
  field :group_version, 2, type: :string, json_name: "groupVersion"
  field :key, 3, type: :string

  field :mount_requirement, 4,
    type: Flyteidl2.Core.Secret.MountType,
    json_name: "mountRequirement",
    enum: true

  field :env_var, 5, type: :string, json_name: "envVar"
end

defmodule Flyteidl2.Core.OAuth2Client do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.15.0", syntax: :proto3

  field :client_id, 1, type: :string, json_name: "clientId"
  field :client_secret, 2, type: Flyteidl2.Core.Secret, json_name: "clientSecret"
end

defmodule Flyteidl2.Core.Identity do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.15.0", syntax: :proto3

  field :iam_role, 1, type: :string, json_name: "iamRole"
  field :k8s_service_account, 2, type: :string, json_name: "k8sServiceAccount"
  field :oauth2_client, 3, type: Flyteidl2.Core.OAuth2Client, json_name: "oauth2Client"
  field :execution_identity, 4, type: :string, json_name: "executionIdentity"
end

defmodule Flyteidl2.Core.OAuth2TokenRequest do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.15.0", syntax: :proto3

  field :name, 1, type: :string
  field :type, 2, type: Flyteidl2.Core.OAuth2TokenRequest.Type, enum: true
  field :client, 3, type: Flyteidl2.Core.OAuth2Client
  field :idp_discovery_endpoint, 4, type: :string, json_name: "idpDiscoveryEndpoint"
  field :token_endpoint, 5, type: :string, json_name: "tokenEndpoint"
end

defmodule Flyteidl2.Core.SecurityContext do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.15.0", syntax: :proto3

  field :run_as, 1, type: Flyteidl2.Core.Identity, json_name: "runAs"
  field :secrets, 2, repeated: true, type: Flyteidl2.Core.Secret
  field :tokens, 3, repeated: true, type: Flyteidl2.Core.OAuth2TokenRequest
end
