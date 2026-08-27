defmodule Flyteidl2.Artifact.CreateArtifactRequest do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.artifact.CreateArtifactRequest",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :artifact_id, 1,
    type: Flyteidl2.Artifact.ArtifactIdentifier,
    json_name: "artifactId",
    deprecated: false

  field :spec, 2, type: Flyteidl2.Artifact.ArtifactSpec, deprecated: false
end

defmodule Flyteidl2.Artifact.CreateArtifactResponse do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.artifact.CreateArtifactResponse",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :artifact, 1, type: Flyteidl2.Artifact.Artifact
end

defmodule Flyteidl2.Artifact.GetArtifactRequest do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.artifact.GetArtifactRequest",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :name, 1, type: Flyteidl2.Artifact.ArtifactName, deprecated: false
  field :version, 2, proto3_optional: true, type: :string, deprecated: false
end

defmodule Flyteidl2.Artifact.GetArtifactResponse do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.artifact.GetArtifactResponse",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :artifact, 1, type: Flyteidl2.Artifact.Artifact
end

defmodule Flyteidl2.Artifact.ListArtifactsRequest do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.artifact.ListArtifactsRequest",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :request, 1, type: Flyteidl2.Common.ListRequest

  field :project_id, 2,
    type: Flyteidl2.Common.ProjectIdentifier,
    json_name: "projectId",
    deprecated: false

  field :name, 3, proto3_optional: true, type: :string, deprecated: false
end

defmodule Flyteidl2.Artifact.ListArtifactsResponse do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.artifact.ListArtifactsResponse",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :artifacts, 1, repeated: true, type: Flyteidl2.Artifact.Artifact
  field :token, 2, type: :string
end

defmodule Flyteidl2.Artifact.ListArtifactNamesRequest do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.artifact.ListArtifactNamesRequest",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :request, 1, type: Flyteidl2.Common.ListRequest

  field :project_id, 2,
    type: Flyteidl2.Common.ProjectIdentifier,
    json_name: "projectId",
    deprecated: false
end

defmodule Flyteidl2.Artifact.ArtifactGroup do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.artifact.ArtifactGroup",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :latest, 1, type: Flyteidl2.Artifact.Artifact
  field :versions, 2, type: :uint64
end

defmodule Flyteidl2.Artifact.ListArtifactNamesResponse do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.artifact.ListArtifactNamesResponse",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :groups, 1, repeated: true, type: Flyteidl2.Artifact.ArtifactGroup
  field :token, 2, type: :string
end

defmodule Flyteidl2.Artifact.ArtifactService.Service do
  @moduledoc false

  use GRPC.Service,
    name: "flyteidl2.artifact.ArtifactService",
    protoc_gen_elixir_version: "0.16.0"

  rpc :CreateArtifact,
      Flyteidl2.Artifact.CreateArtifactRequest,
      Flyteidl2.Artifact.CreateArtifactResponse

  rpc :GetArtifact, Flyteidl2.Artifact.GetArtifactRequest, Flyteidl2.Artifact.GetArtifactResponse

  rpc :ListArtifacts,
      Flyteidl2.Artifact.ListArtifactsRequest,
      Flyteidl2.Artifact.ListArtifactsResponse

  rpc :ListArtifactNames,
      Flyteidl2.Artifact.ListArtifactNamesRequest,
      Flyteidl2.Artifact.ListArtifactNamesResponse
end

defmodule Flyteidl2.Artifact.ArtifactService.Stub do
  @moduledoc false

  use GRPC.Stub, service: Flyteidl2.Artifact.ArtifactService.Service
end
