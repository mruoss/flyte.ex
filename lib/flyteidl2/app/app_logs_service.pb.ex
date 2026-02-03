defmodule Flyteidl2.App.AppLogsService.Service do
  @moduledoc false

  use GRPC.Service, name: "flyteidl2.app.AppLogsService", protoc_gen_elixir_version: "0.16.0"

  rpc :TailLogs, Flyteidl2.App.TailLogsRequest, stream(Flyteidl2.App.TailLogsResponse)
end

defmodule Flyteidl2.App.AppLogsService.Stub do
  @moduledoc false

  use GRPC.Stub, service: Flyteidl2.App.AppLogsService.Service
end
