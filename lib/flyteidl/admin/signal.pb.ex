defmodule Flyteidl.Admin.SignalGetOrCreateRequest do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :id, 1, type: Flyteidl.Core.SignalIdentifier
  field :type, 2, type: Flyteidl.Core.LiteralType
end

defmodule Flyteidl.Admin.SignalListRequest do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :workflow_execution_id, 1,
    type: Flyteidl.Core.WorkflowExecutionIdentifier,
    json_name: "workflowExecutionId"

  field :limit, 2, type: :uint32
  field :token, 3, type: :string
  field :filters, 4, type: :string
  field :sort_by, 5, type: Flyteidl.Admin.Sort, json_name: "sortBy"
end

defmodule Flyteidl.Admin.SignalList do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :signals, 1, repeated: true, type: Flyteidl.Admin.Signal
  field :token, 2, type: :string
end

defmodule Flyteidl.Admin.SignalSetRequest do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :id, 1, type: Flyteidl.Core.SignalIdentifier
  field :value, 2, type: Flyteidl.Core.Literal
end

defmodule Flyteidl.Admin.SignalSetResponse do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"
end

defmodule Flyteidl.Admin.Signal do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :id, 1, type: Flyteidl.Core.SignalIdentifier
  field :type, 2, type: Flyteidl.Core.LiteralType
  field :value, 3, type: Flyteidl.Core.Literal
end