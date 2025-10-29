defmodule Flyteidl2.App.AppService.Service do
  @moduledoc false

  use GRPC.Service, name: "flyteidl2.app.AppService", protoc_gen_elixir_version: "0.15.0"

  rpc :Create, Flyteidl2.App.CreateRequest, Flyteidl2.App.CreateResponse

  rpc :Get, Flyteidl2.App.GetRequest, Flyteidl2.App.GetResponse

  rpc :Update, Flyteidl2.App.UpdateRequest, Flyteidl2.App.UpdateResponse

  rpc :UpdateStatus, Flyteidl2.App.UpdateStatusRequest, Flyteidl2.App.UpdateStatusResponse

  rpc :Delete, Flyteidl2.App.DeleteRequest, Flyteidl2.App.DeleteResponse

  rpc :List, Flyteidl2.App.ListRequest, Flyteidl2.App.ListResponse

  rpc :Watch, Flyteidl2.App.WatchRequest, stream(Flyteidl2.App.WatchResponse)

  rpc :Lease, Flyteidl2.App.LeaseRequest, stream(Flyteidl2.App.LeaseResponse)
end

defmodule Flyteidl2.App.AppService.Stub do
  @moduledoc false

  use GRPC.Stub, service: Flyteidl2.App.AppService.Service
end
