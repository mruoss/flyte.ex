defmodule Flyteidl2.Cluster.ClusterService.Service do
  @moduledoc false

  use GRPC.Service, name: "flyteidl2.cluster.ClusterService", protoc_gen_elixir_version: "0.16.0"

  rpc :SelectCluster,
      Flyteidl2.Cluster.SelectClusterRequest,
      Flyteidl2.Cluster.SelectClusterResponse
end

defmodule Flyteidl2.Cluster.ClusterService.Stub do
  @moduledoc false

  use GRPC.Stub, service: Flyteidl2.Cluster.ClusterService.Service
end
