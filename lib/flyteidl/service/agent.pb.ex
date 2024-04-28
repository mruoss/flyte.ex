defmodule Flyteidl.Service.AsyncAgentService.Service do
  @moduledoc false

  use GRPC.Service,
    name: "flyteidl.service.AsyncAgentService",
    protoc_gen_elixir_version: "0.12.0"

  rpc :CreateTask, Flyteidl.Admin.CreateTaskRequest, Flyteidl.Admin.CreateTaskResponse

  rpc :GetTask, Flyteidl.Admin.GetTaskRequest, Flyteidl.Admin.GetTaskResponse

  rpc :DeleteTask, Flyteidl.Admin.DeleteTaskRequest, Flyteidl.Admin.DeleteTaskResponse
end

defmodule Flyteidl.Service.AsyncAgentService.Stub do
  @moduledoc false

  use GRPC.Stub, service: Flyteidl.Service.AsyncAgentService.Service
end