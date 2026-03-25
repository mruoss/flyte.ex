defmodule Flyteidl2.Workflow.RunInfo do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.workflow.RunInfo",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :task_spec_digest, 1, type: :string, json_name: "taskSpecDigest"
  field :inputs_uri, 2, type: :string, json_name: "inputsUri"
  field :outputs_uri, 3, type: :string, json_name: "outputsUri"
  field :run_spec, 4, type: Flyteidl2.Task.RunSpec, json_name: "runSpec"
end
