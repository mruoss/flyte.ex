defmodule Flyteidl2.App.TailLogsRequest do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.15.0", syntax: :proto3

  oneof :target, 0

  field :app_id, 1, type: Flyteidl2.App.Identifier, json_name: "appId", oneof: 0
  field :replica_id, 2, type: Flyteidl2.App.ReplicaIdentifier, json_name: "replicaId", oneof: 0
end

defmodule Flyteidl2.App.ReplicaIdentifierList do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.15.0", syntax: :proto3

  field :replicas, 1, repeated: true, type: Flyteidl2.App.ReplicaIdentifier
end

defmodule Flyteidl2.App.LogLines do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.15.0", syntax: :proto3

  field :lines, 1, repeated: true, type: :string, deprecated: true

  field :replica_id, 2,
    type: Flyteidl2.App.ReplicaIdentifier,
    json_name: "replicaId",
    deprecated: false

  field :structured_lines, 3,
    repeated: true,
    type: Flyteidl2.Logs.Dataplane.LogLine,
    json_name: "structuredLines"
end

defmodule Flyteidl2.App.LogLinesBatch do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.15.0", syntax: :proto3

  field :logs, 1, repeated: true, type: Flyteidl2.App.LogLines
end

defmodule Flyteidl2.App.TailLogsResponse do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.15.0", syntax: :proto3

  oneof :resp, 0

  field :replicas, 1, type: Flyteidl2.App.ReplicaIdentifierList, oneof: 0

  field :log_lines, 2,
    type: Flyteidl2.Logs.Dataplane.LogLines,
    json_name: "logLines",
    oneof: 0,
    deprecated: true

  field :batches, 3, type: Flyteidl2.App.LogLinesBatch, oneof: 0
end
