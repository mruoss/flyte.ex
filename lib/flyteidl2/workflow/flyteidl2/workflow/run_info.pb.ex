defmodule Flyteidl2.Workflow.RunInfo do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.workflow.RunInfo",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :task_spec_digest, 1, type: :string, json_name: "taskSpecDigest"
  field :inputs_uri, 2, type: :string, json_name: "inputsUri"
  field :outputs_uri, 3, type: :string, json_name: "outputsUri"
  field :run_spec, 4, type: Flyteidl2.Task.RunSpec, json_name: "runSpec"
  field :condition, 5, type: Flyteidl2.Workflow.ConditionAction
  field :output, 6, type: Flyteidl2.Core.Literal
  field :principal, 7, type: Flyteidl2.Common.EnrichedIdentity
end
