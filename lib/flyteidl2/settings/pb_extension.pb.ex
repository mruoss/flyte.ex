defmodule Flyteidl2.Settings.PbExtension do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.17.0"

  extend Google.Protobuf.FieldOptions, :desc, 1364, optional: true, type: :string
end
