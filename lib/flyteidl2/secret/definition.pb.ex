defmodule Flyteidl2.Secret.SecretType do
  @moduledoc false

  use Protobuf,
    enum: true,
    full_name: "flyteidl2.secret.SecretType",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :SECRET_TYPE_GENERIC, 0
  field :SECRET_TYPE_IMAGE_PULL_SECRET, 1
end

defmodule Flyteidl2.Secret.OverallStatus do
  @moduledoc false

  use Protobuf,
    enum: true,
    full_name: "flyteidl2.secret.OverallStatus",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :UNSPECIFIED, 0
  field :PARTIALLY_PRESENT, 1
  field :FULLY_PRESENT, 2
  field :UNKNOWN_STATUS, 3
end

defmodule Flyteidl2.Secret.SecretPresenceStatus do
  @moduledoc false

  use Protobuf,
    enum: true,
    full_name: "flyteidl2.secret.SecretPresenceStatus",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :UNKNOWN, 0
  field :MISSING, 1
  field :PRESENT, 2
end

defmodule Flyteidl2.Secret.SecretSpec do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.secret.SecretSpec",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  oneof :value, 0

  field :string_value, 1, type: :string, json_name: "stringValue", oneof: 0
  field :binary_value, 2, type: :bytes, json_name: "binaryValue", oneof: 0
  field :type, 3, type: Flyteidl2.Secret.SecretType, enum: true
end

defmodule Flyteidl2.Secret.SecretIdentifier do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.secret.SecretIdentifier",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :name, 1, type: :string, deprecated: false
  field :organization, 2, type: :string
  field :domain, 3, type: :string
  field :project, 4, type: :string
end

defmodule Flyteidl2.Secret.SecretMetadata do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.secret.SecretMetadata",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :created_time, 1, type: Google.Protobuf.Timestamp, json_name: "createdTime"
  field :secret_status, 2, type: Flyteidl2.Secret.SecretStatus, json_name: "secretStatus"
  field :type, 3, type: Flyteidl2.Secret.SecretType, enum: true
end

defmodule Flyteidl2.Secret.SecretStatus do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.secret.SecretStatus",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :overall_status, 1,
    type: Flyteidl2.Secret.OverallStatus,
    json_name: "overallStatus",
    enum: true

  field :cluster_status, 2,
    repeated: true,
    type: Flyteidl2.Secret.ClusterSecretStatus,
    json_name: "clusterStatus"
end

defmodule Flyteidl2.Secret.ClusterSecretStatus do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.secret.ClusterSecretStatus",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :cluster, 1, type: Flyteidl2.Common.ClusterIdentifier

  field :presence_status, 2,
    type: Flyteidl2.Secret.SecretPresenceStatus,
    json_name: "presenceStatus",
    enum: true
end

defmodule Flyteidl2.Secret.Secret do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.secret.Secret",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :id, 1, type: Flyteidl2.Secret.SecretIdentifier
  field :secret_metadata, 2, type: Flyteidl2.Secret.SecretMetadata, json_name: "secretMetadata"
end
