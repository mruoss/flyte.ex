defmodule Flyteidl2.Plugins.HiveQuery do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.plugins.HiveQuery",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :query, 1, type: :string
  field :timeout_sec, 2, type: :uint32, json_name: "timeoutSec"
  field :retryCount, 3, type: :uint32
end

defmodule Flyteidl2.Plugins.HiveQueryCollection do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.plugins.HiveQueryCollection",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :queries, 2, repeated: true, type: Flyteidl2.Plugins.HiveQuery
end

defmodule Flyteidl2.Plugins.QuboleHiveJob do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.plugins.QuboleHiveJob",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :cluster_label, 1, type: :string, json_name: "clusterLabel"

  field :query_collection, 2,
    type: Flyteidl2.Plugins.HiveQueryCollection,
    json_name: "queryCollection",
    deprecated: true

  field :tags, 3, repeated: true, type: :string
  field :query, 4, type: Flyteidl2.Plugins.HiveQuery
end
