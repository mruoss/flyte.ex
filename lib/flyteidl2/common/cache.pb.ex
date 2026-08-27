defmodule Flyteidl2.Common.CacheMetadata do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.common.CacheMetadata",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :source_action_attempt, 1,
    type: Flyteidl2.Common.ActionAttemptIdentifier,
    json_name: "sourceActionAttempt"
end
