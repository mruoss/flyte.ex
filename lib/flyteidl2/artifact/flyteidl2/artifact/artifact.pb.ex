defmodule Flyteidl2.Artifact.ArtifactName do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.artifact.ArtifactName",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :org, 1, type: :string, deprecated: false
  field :project, 2, type: :string, deprecated: false
  field :domain, 3, type: :string, deprecated: false
  field :name, 4, type: :string, deprecated: false
end

defmodule Flyteidl2.Artifact.ArtifactIdentifier do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.artifact.ArtifactIdentifier",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :name, 1, type: Flyteidl2.Artifact.ArtifactName, deprecated: false
  field :version, 2, type: :string, deprecated: false
end

defmodule Flyteidl2.Artifact.Card do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.artifact.Card",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :uri, 1, type: :string, deprecated: false
  field :format, 2, type: :string, deprecated: false
  field :type, 3, type: :string, deprecated: false
end

defmodule Flyteidl2.Artifact.ArtifactSpec.UserMetadataEntry do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.artifact.ArtifactSpec.UserMetadataEntry",
    map: true,
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :key, 1, type: :string
  field :value, 2, type: :string
end

defmodule Flyteidl2.Artifact.ArtifactSpec do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.artifact.ArtifactSpec",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :value, 1, type: Flyteidl2.Core.Literal, deprecated: false
  field :type, 2, type: Flyteidl2.Core.LiteralType, deprecated: false
  field :description, 3, type: :string, deprecated: false

  field :user_metadata, 4,
    repeated: true,
    type: Flyteidl2.Artifact.ArtifactSpec.UserMetadataEntry,
    json_name: "userMetadata",
    map: true

  field :card, 5, type: Flyteidl2.Artifact.Card
end

defmodule Flyteidl2.Artifact.Artifact do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.artifact.Artifact",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :artifact_id, 1, type: Flyteidl2.Artifact.ArtifactIdentifier, json_name: "artifactId"
  field :spec, 2, type: Flyteidl2.Artifact.ArtifactSpec
  field :created_at, 3, type: Google.Protobuf.Timestamp, json_name: "createdAt"
  field :created_by, 4, type: Flyteidl2.Common.EnrichedIdentity, json_name: "createdBy"
end
