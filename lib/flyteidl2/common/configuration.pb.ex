defmodule Flyteidl2.Common.AttributesSource do
  @moduledoc false

  use Protobuf, enum: true, protoc_gen_elixir_version: "0.15.0", syntax: :proto3

  field :SOURCE_UNSPECIFIED, 0
  field :GLOBAL, 1
  field :DOMAIN, 2
  field :PROJECT, 3
  field :PROJECT_DOMAIN, 4
  field :ORG, 5
end
