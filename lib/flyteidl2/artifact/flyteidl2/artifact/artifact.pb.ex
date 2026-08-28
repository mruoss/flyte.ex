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

defmodule Flyteidl2.Artifact.TaskActionSource do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.artifact.TaskActionSource",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :action, 1, type: Flyteidl2.Common.ActionIdentifier, deprecated: false
  field :attempt, 2, type: :uint32
end

defmodule Flyteidl2.Artifact.ArtifactSource do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.artifact.ArtifactSource",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  oneof :source, 0

  field :task_action, 1,
    type: Flyteidl2.Artifact.TaskActionSource,
    json_name: "taskAction",
    oneof: 0

  field :external_ref, 2, type: :string, json_name: "externalRef", oneof: 0, deprecated: false
end

defmodule Flyteidl2.Artifact.ArtifactSpec do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.artifact.ArtifactSpec",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :value, 1, type: Flyteidl2.Core.Literal, deprecated: false
  field :type, 2, type: Flyteidl2.Core.LiteralType, deprecated: false
  field :info, 3, type: Flyteidl2.Core.ArtifactInfo
  field :source, 6, type: Flyteidl2.Artifact.ArtifactSource
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
