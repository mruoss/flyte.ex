defmodule Flyteidl2.Plugins.DaskJob do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.plugins.DaskJob",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :scheduler, 1, type: Flyteidl2.Plugins.DaskScheduler
  field :workers, 2, type: Flyteidl2.Plugins.DaskWorkerGroup
end

defmodule Flyteidl2.Plugins.DaskScheduler do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.plugins.DaskScheduler",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :image, 1, type: :string
  field :resources, 2, type: Flyteidl2.Core.Resources
end

defmodule Flyteidl2.Plugins.DaskWorkerGroup do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.plugins.DaskWorkerGroup",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :number_of_workers, 1, type: :uint32, json_name: "numberOfWorkers"
  field :image, 2, type: :string
  field :resources, 3, type: Flyteidl2.Core.Resources
end
