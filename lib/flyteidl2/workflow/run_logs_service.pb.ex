defmodule Flyteidl2.Workflow.TailLogsRequest do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.workflow.TailLogsRequest",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :action_id, 1,
    type: Flyteidl2.Common.ActionIdentifier,
    json_name: "actionId",
    deprecated: false

  field :attempt, 2, type: :uint32, deprecated: false
end

defmodule Flyteidl2.Workflow.TailLogsResponse.Logs do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.workflow.TailLogsResponse.Logs",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :lines, 1, repeated: true, type: Flyteidl2.Logs.Dataplane.LogLine
end

defmodule Flyteidl2.Workflow.TailLogsResponse do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.workflow.TailLogsResponse",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :logs, 1, repeated: true, type: Flyteidl2.Workflow.TailLogsResponse.Logs
end

defmodule Flyteidl2.Workflow.RunLogsService.Service do
  @moduledoc false

  use GRPC.Service, name: "flyteidl2.workflow.RunLogsService", protoc_gen_elixir_version: "0.16.0"

  rpc :TailLogs, Flyteidl2.Workflow.TailLogsRequest, stream(Flyteidl2.Workflow.TailLogsResponse)
end

defmodule Flyteidl2.Workflow.RunLogsService.Stub do
  @moduledoc false

  use GRPC.Stub, service: Flyteidl2.Workflow.RunLogsService.Service
end
