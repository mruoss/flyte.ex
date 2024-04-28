defmodule Flyteidl.Core.DynamicJobSpec do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :nodes, 1, repeated: true, type: Flyteidl.Core.Node
  field :min_successes, 2, type: :int64, json_name: "minSuccesses"
  field :outputs, 3, repeated: true, type: Flyteidl.Core.Binding
  field :tasks, 4, repeated: true, type: Flyteidl.Core.TaskTemplate
  field :subworkflows, 5, repeated: true, type: Flyteidl.Core.WorkflowTemplate
end