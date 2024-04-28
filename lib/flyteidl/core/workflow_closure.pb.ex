defmodule Flyteidl.Core.WorkflowClosure do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :workflow, 1, type: Flyteidl.Core.WorkflowTemplate
  field :tasks, 2, repeated: true, type: Flyteidl.Core.TaskTemplate
end