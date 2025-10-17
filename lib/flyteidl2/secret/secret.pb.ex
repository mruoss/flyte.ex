defmodule Flyteidl2.Secret.SecretService.Service do
  @moduledoc false

  use GRPC.Service, name: "flyteidl2.secret.SecretService", protoc_gen_elixir_version: "0.15.0"

  rpc :CreateSecret, Flyteidl2.Secret.CreateSecretRequest, Flyteidl2.Secret.CreateSecretResponse

  rpc :UpdateSecret, Flyteidl2.Secret.UpdateSecretRequest, Flyteidl2.Secret.UpdateSecretResponse

  rpc :GetSecret, Flyteidl2.Secret.GetSecretRequest, Flyteidl2.Secret.GetSecretResponse

  rpc :DeleteSecret, Flyteidl2.Secret.DeleteSecretRequest, Flyteidl2.Secret.DeleteSecretResponse

  rpc :ListSecrets, Flyteidl2.Secret.ListSecretsRequest, Flyteidl2.Secret.ListSecretsResponse
end

defmodule Flyteidl2.Secret.SecretService.Stub do
  @moduledoc false

  use GRPC.Stub, service: Flyteidl2.Secret.SecretService.Service
end
