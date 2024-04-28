defmodule Flyteidl.Plugins.HiveQuery do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :query, 1, type: :string
  field :timeout_sec, 2, type: :uint32, json_name: "timeoutSec"
  field :retryCount, 3, type: :uint32
end

defmodule Flyteidl.Plugins.HiveQueryCollection do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :queries, 2, repeated: true, type: Flyteidl.Plugins.HiveQuery
end

defmodule Flyteidl.Plugins.QuboleHiveJob do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :cluster_label, 1, type: :string, json_name: "clusterLabel"

  field :query_collection, 2,
    type: Flyteidl.Plugins.HiveQueryCollection,
    json_name: "queryCollection",
    deprecated: true

  field :tags, 3, repeated: true, type: :string
  field :query, 4, type: Flyteidl.Plugins.HiveQuery
end