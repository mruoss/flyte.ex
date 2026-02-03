defmodule Flyteidl2.App.ReplicaIdentifier do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.app.ReplicaIdentifier",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :app_id, 1, type: Flyteidl2.App.Identifier, json_name: "appId", deprecated: false
  field :name, 2, type: :string, deprecated: false
end

defmodule Flyteidl2.App.ReplicaMeta do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.app.ReplicaMeta",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :id, 1, type: Flyteidl2.App.ReplicaIdentifier, deprecated: false
  field :revision, 2, type: :uint64
end

defmodule Flyteidl2.App.ReplicaList do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.app.ReplicaList",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :items, 1, repeated: true, type: Flyteidl2.App.Replica
end

defmodule Flyteidl2.App.Replica do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.app.Replica",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :metadata, 1, type: Flyteidl2.App.ReplicaMeta, deprecated: false
  field :status, 2, type: Flyteidl2.App.ReplicaStatus
end

defmodule Flyteidl2.App.ReplicaStatus do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.app.ReplicaStatus",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :deployment_status, 1, type: :string, json_name: "deploymentStatus"
  field :reason, 2, type: :string
end
