defmodule Flyteidl.Core.CatalogCacheStatus do
  @moduledoc false

  use Protobuf, enum: true, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :CACHE_DISABLED, 0
  field :CACHE_MISS, 1
  field :CACHE_HIT, 2
  field :CACHE_POPULATED, 3
  field :CACHE_LOOKUP_FAILURE, 4
  field :CACHE_PUT_FAILURE, 5
  field :CACHE_SKIPPED, 6
end

defmodule Flyteidl.Core.CatalogReservation.Status do
  @moduledoc false

  use Protobuf, enum: true, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :RESERVATION_DISABLED, 0
  field :RESERVATION_ACQUIRED, 1
  field :RESERVATION_EXISTS, 2
  field :RESERVATION_RELEASED, 3
  field :RESERVATION_FAILURE, 4
end

defmodule Flyteidl.Core.CatalogArtifactTag do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :artifact_id, 1, type: :string, json_name: "artifactId"
  field :name, 2, type: :string
end

defmodule Flyteidl.Core.CatalogMetadata do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  oneof :source_execution, 0

  field :dataset_id, 1, type: Flyteidl.Core.Identifier, json_name: "datasetId"
  field :artifact_tag, 2, type: Flyteidl.Core.CatalogArtifactTag, json_name: "artifactTag"

  field :source_task_execution, 3,
    type: Flyteidl.Core.TaskExecutionIdentifier,
    json_name: "sourceTaskExecution",
    oneof: 0
end

defmodule Flyteidl.Core.CatalogReservation do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"
end