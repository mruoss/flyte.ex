defmodule Flyteidl2.Secret.CreateSecretRequest do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.secret.CreateSecretRequest",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :id, 1, type: Flyteidl2.Secret.SecretIdentifier, deprecated: false
  field :secret_spec, 2, type: Flyteidl2.Secret.SecretSpec, json_name: "secretSpec"
end

defmodule Flyteidl2.Secret.CreateSecretResponse do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.secret.CreateSecretResponse",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3
end

defmodule Flyteidl2.Secret.UpdateSecretRequest do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.secret.UpdateSecretRequest",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :id, 1, type: Flyteidl2.Secret.SecretIdentifier, deprecated: false
  field :secret_spec, 2, type: Flyteidl2.Secret.SecretSpec, json_name: "secretSpec"
end

defmodule Flyteidl2.Secret.UpdateSecretResponse do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.secret.UpdateSecretResponse",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3
end

defmodule Flyteidl2.Secret.GetSecretRequest do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.secret.GetSecretRequest",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :id, 1, type: Flyteidl2.Secret.SecretIdentifier, deprecated: false
end

defmodule Flyteidl2.Secret.GetSecretResponse do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.secret.GetSecretResponse",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :secret, 1, type: Flyteidl2.Secret.Secret
end

defmodule Flyteidl2.Secret.DeleteSecretRequest do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.secret.DeleteSecretRequest",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :id, 1, type: Flyteidl2.Secret.SecretIdentifier, deprecated: false
end

defmodule Flyteidl2.Secret.DeleteSecretResponse do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.secret.DeleteSecretResponse",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3
end

defmodule Flyteidl2.Secret.ListSecretsRequest.PerClusterTokensEntry do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.secret.ListSecretsRequest.PerClusterTokensEntry",
    map: true,
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :key, 1, type: :string
  field :value, 2, type: :string
end

defmodule Flyteidl2.Secret.ListSecretsRequest do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.secret.ListSecretsRequest",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :organization, 1, type: :string
  field :domain, 2, type: :string
  field :project, 3, type: :string
  field :limit, 4, type: :int32
  field :token, 5, type: :string

  field :per_cluster_tokens, 6,
    repeated: true,
    type: Flyteidl2.Secret.ListSecretsRequest.PerClusterTokensEntry,
    json_name: "perClusterTokens",
    map: true
end

defmodule Flyteidl2.Secret.ListSecretsResponse.PerClusterTokensEntry do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.secret.ListSecretsResponse.PerClusterTokensEntry",
    map: true,
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :key, 1, type: :string
  field :value, 2, type: :string
end

defmodule Flyteidl2.Secret.ListSecretsResponse do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.secret.ListSecretsResponse",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :secrets, 1, repeated: true, type: Flyteidl2.Secret.Secret
  field :token, 2, type: :string

  field :per_cluster_tokens, 3,
    repeated: true,
    type: Flyteidl2.Secret.ListSecretsResponse.PerClusterTokensEntry,
    json_name: "perClusterTokens",
    map: true
end
