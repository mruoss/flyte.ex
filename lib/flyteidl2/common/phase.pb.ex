defmodule Flyteidl2.Common.ActionPhase do
  @moduledoc false

  use Protobuf,
    enum: true,
    full_name: "flyteidl2.common.ActionPhase",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :ACTION_PHASE_UNSPECIFIED, 0
  field :ACTION_PHASE_QUEUED, 1
  field :ACTION_PHASE_WAITING_FOR_RESOURCES, 2
  field :ACTION_PHASE_INITIALIZING, 3
  field :ACTION_PHASE_RUNNING, 4
  field :ACTION_PHASE_SUCCEEDED, 5
  field :ACTION_PHASE_FAILED, 6
  field :ACTION_PHASE_ABORTED, 7
  field :ACTION_PHASE_TIMED_OUT, 8
end
