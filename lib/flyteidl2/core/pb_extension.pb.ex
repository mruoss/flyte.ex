defmodule Flyteidl2.Core.PbExtension do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.17.1"

  extend Google.Protobuf.EnumValueOptions, :accelerator_name, 1365,
    optional: true,
    type: :string,
    json_name: "acceleratorName"
end
