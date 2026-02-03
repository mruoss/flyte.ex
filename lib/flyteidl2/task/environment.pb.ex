defmodule Flyteidl2.Task.Environment do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.task.Environment",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :name, 1, type: :string, deprecated: false
  field :description, 2, type: :string, deprecated: false
end
