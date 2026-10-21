defmodule Flyteidl2.Common.ActionAddress do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.common.ActionAddress",
    protoc_gen_elixir_version: "0.17.1",
    syntax: :proto3

  field :pod, 1, type: Flyteidl2.Common.PodAddress
  field :path, 2, type: :string
  field :url, 3, type: :string, deprecated: false
  field :cluster, 4, type: :string
end

defmodule Flyteidl2.Common.PodAddress do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.common.PodAddress",
    protoc_gen_elixir_version: "0.17.1",
    syntax: :proto3

  field :namespace, 1, type: :string
  field :name, 2, type: :string
  field :ip, 3, type: :string
  field :port, 4, type: :uint32, deprecated: false
end
