defmodule Flyteidl2.Org.PbExtension do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.16.0"

  extend Google.Protobuf.FieldOptions, :desc, 50000, optional: true, type: :string
end
