defmodule Flyteidl2.Connector.AsyncConnectorService.Service do
  @moduledoc false

  use GRPC.Service,
    name: "flyteidl2.connector.AsyncConnectorService",
    protoc_gen_elixir_version: "0.16.0"

  rpc :CreateTask, Flyteidl2.Connector.CreateTaskRequest, Flyteidl2.Connector.CreateTaskResponse

  rpc :GetTask, Flyteidl2.Connector.GetTaskRequest, Flyteidl2.Connector.GetTaskResponse

  rpc :DeleteTask, Flyteidl2.Connector.DeleteTaskRequest, Flyteidl2.Connector.DeleteTaskResponse

  rpc :GetTaskMetrics,
      Flyteidl2.Connector.GetTaskMetricsRequest,
      Flyteidl2.Connector.GetTaskMetricsResponse

  rpc :GetTaskLogs,
      Flyteidl2.Connector.GetTaskLogsRequest,
      stream(Flyteidl2.Connector.GetTaskLogsResponse)
end

defmodule Flyteidl2.Connector.AsyncConnectorService.Stub do
  @moduledoc false

  use GRPC.Stub, service: Flyteidl2.Connector.AsyncConnectorService.Service
end

defmodule Flyteidl2.Connector.ConnectorMetadataService.Service do
  @moduledoc false

  use GRPC.Service,
    name: "flyteidl2.connector.ConnectorMetadataService",
    protoc_gen_elixir_version: "0.16.0"

  rpc :GetConnector,
      Flyteidl2.Connector.GetConnectorRequest,
      Flyteidl2.Connector.GetConnectorResponse

  rpc :ListConnectors,
      Flyteidl2.Connector.ListConnectorsRequest,
      Flyteidl2.Connector.ListConnectorsResponse
end

defmodule Flyteidl2.Connector.ConnectorMetadataService.Stub do
  @moduledoc false

  use GRPC.Stub, service: Flyteidl2.Connector.ConnectorMetadataService.Service
end
