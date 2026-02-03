defmodule Flyteidl2.Common.AttributesSource do
  @moduledoc false

  use Protobuf,
    enum: true,
    full_name: "flyteidl2.common.AttributesSource",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :SOURCE_UNSPECIFIED, 0
  field :GLOBAL, 1
  field :DOMAIN, 2
  field :PROJECT, 3
  field :PROJECT_DOMAIN, 4
  field :ORG, 5
end
