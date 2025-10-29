defmodule Flyteidl2.Service.AsyncConnectorService.Service do
  @moduledoc false

  use GRPC.Service,
    name: "flyteidl2.service.AsyncConnectorService",
    protoc_gen_elixir_version: "0.15.0"

  rpc :CreateTask, Flyteidl2.Plugins.CreateTaskRequest, Flyteidl2.Plugins.CreateTaskResponse

  rpc :GetTask, Flyteidl2.Plugins.GetTaskRequest, Flyteidl2.Plugins.GetTaskResponse

  rpc :DeleteTask, Flyteidl2.Plugins.DeleteTaskRequest, Flyteidl2.Plugins.DeleteTaskResponse

  rpc :GetTaskMetrics,
      Flyteidl2.Plugins.GetTaskMetricsRequest,
      Flyteidl2.Plugins.GetTaskMetricsResponse

  rpc :GetTaskLogs,
      Flyteidl2.Plugins.GetTaskLogsRequest,
      stream(Flyteidl2.Plugins.GetTaskLogsResponse)
end

defmodule Flyteidl2.Service.AsyncConnectorService.Stub do
  @moduledoc false

  use GRPC.Stub, service: Flyteidl2.Service.AsyncConnectorService.Service
end

defmodule Flyteidl2.Service.ConnectorMetadataService.Service do
  @moduledoc false

  use GRPC.Service,
    name: "flyteidl2.service.ConnectorMetadataService",
    protoc_gen_elixir_version: "0.15.0"

  rpc :GetConnector, Flyteidl2.Plugins.GetConnectorRequest, Flyteidl2.Plugins.GetConnectorResponse

  rpc :ListConnectors,
      Flyteidl2.Plugins.ListConnectorsRequest,
      Flyteidl2.Plugins.ListConnectorsResponse
end

defmodule Flyteidl2.Service.ConnectorMetadataService.Stub do
  @moduledoc false

  use GRPC.Stub, service: Flyteidl2.Service.ConnectorMetadataService.Service
end
