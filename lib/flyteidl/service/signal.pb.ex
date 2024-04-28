defmodule Flyteidl.Service.SignalService.Service do
  @moduledoc false

  use GRPC.Service, name: "flyteidl.service.SignalService", protoc_gen_elixir_version: "0.12.0"

  rpc :GetOrCreateSignal, Flyteidl.Admin.SignalGetOrCreateRequest, Flyteidl.Admin.Signal

  rpc :ListSignals, Flyteidl.Admin.SignalListRequest, Flyteidl.Admin.SignalList

  rpc :SetSignal, Flyteidl.Admin.SignalSetRequest, Flyteidl.Admin.SignalSetResponse
end

defmodule Flyteidl.Service.SignalService.Stub do
  @moduledoc false

  use GRPC.Stub, service: Flyteidl.Service.SignalService.Service
end