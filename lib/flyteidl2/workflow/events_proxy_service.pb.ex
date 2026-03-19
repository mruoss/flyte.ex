defmodule Flyteidl2.Workflow.RecordRequest do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.workflow.RecordRequest",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :events, 1, repeated: true, type: Flyteidl2.Workflow.ActionEvent, deprecated: false
end

defmodule Flyteidl2.Workflow.RecordResponse do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.workflow.RecordResponse",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3
end

defmodule Flyteidl2.Workflow.EventsProxyService.Service do
  @moduledoc false

  use GRPC.Service,
    name: "flyteidl2.workflow.EventsProxyService",
    protoc_gen_elixir_version: "0.16.0"

  rpc :Record, Flyteidl2.Workflow.RecordRequest, Flyteidl2.Workflow.RecordResponse
end

defmodule Flyteidl2.Workflow.EventsProxyService.Stub do
  @moduledoc false

  use GRPC.Stub, service: Flyteidl2.Workflow.EventsProxyService.Service
end
