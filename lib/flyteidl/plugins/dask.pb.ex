defmodule Flyteidl.Plugins.DaskJob do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :scheduler, 1, type: Flyteidl.Plugins.DaskScheduler
  field :workers, 2, type: Flyteidl.Plugins.DaskWorkerGroup
end

defmodule Flyteidl.Plugins.DaskScheduler do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :image, 1, type: :string
  field :resources, 2, type: Flyteidl.Core.Resources
end

defmodule Flyteidl.Plugins.DaskWorkerGroup do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :number_of_workers, 1, type: :uint32, json_name: "numberOfWorkers"
  field :image, 2, type: :string
  field :resources, 3, type: Flyteidl.Core.Resources
end