defmodule Flyteidl.Core.WorkflowExecution.Phase do
  @moduledoc false

  use Protobuf, enum: true, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :UNDEFINED, 0
  field :QUEUED, 1
  field :RUNNING, 2
  field :SUCCEEDING, 3
  field :SUCCEEDED, 4
  field :FAILING, 5
  field :FAILED, 6
  field :ABORTED, 7
  field :TIMED_OUT, 8
  field :ABORTING, 9
end

defmodule Flyteidl.Core.NodeExecution.Phase do
  @moduledoc false

  use Protobuf, enum: true, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :UNDEFINED, 0
  field :QUEUED, 1
  field :RUNNING, 2
  field :SUCCEEDED, 3
  field :FAILING, 4
  field :FAILED, 5
  field :ABORTED, 6
  field :SKIPPED, 7
  field :TIMED_OUT, 8
  field :DYNAMIC_RUNNING, 9
  field :RECOVERED, 10
end

defmodule Flyteidl.Core.TaskExecution.Phase do
  @moduledoc false

  use Protobuf, enum: true, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :UNDEFINED, 0
  field :QUEUED, 1
  field :RUNNING, 2
  field :SUCCEEDED, 3
  field :ABORTED, 4
  field :FAILED, 5
  field :INITIALIZING, 6
  field :WAITING_FOR_RESOURCES, 7
end

defmodule Flyteidl.Core.ExecutionError.ErrorKind do
  @moduledoc false

  use Protobuf, enum: true, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :UNKNOWN, 0
  field :USER, 1
  field :SYSTEM, 2
end

defmodule Flyteidl.Core.TaskLog.MessageFormat do
  @moduledoc false

  use Protobuf, enum: true, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :UNKNOWN, 0
  field :CSV, 1
  field :JSON, 2
end

defmodule Flyteidl.Core.QualityOfService.Tier do
  @moduledoc false

  use Protobuf, enum: true, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :UNDEFINED, 0
  field :HIGH, 1
  field :MEDIUM, 2
  field :LOW, 3
end

defmodule Flyteidl.Core.WorkflowExecution do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"
end

defmodule Flyteidl.Core.NodeExecution do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"
end

defmodule Flyteidl.Core.TaskExecution do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"
end

defmodule Flyteidl.Core.ExecutionError do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :code, 1, type: :string
  field :message, 2, type: :string
  field :error_uri, 3, type: :string, json_name: "errorUri"
  field :kind, 4, type: Flyteidl.Core.ExecutionError.ErrorKind, enum: true
end

defmodule Flyteidl.Core.TaskLog do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :uri, 1, type: :string
  field :name, 2, type: :string

  field :message_format, 3,
    type: Flyteidl.Core.TaskLog.MessageFormat,
    json_name: "messageFormat",
    enum: true

  field :ttl, 4, type: Google.Protobuf.Duration
end

defmodule Flyteidl.Core.QualityOfServiceSpec do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :queueing_budget, 1, type: Google.Protobuf.Duration, json_name: "queueingBudget"
end

defmodule Flyteidl.Core.QualityOfService do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  oneof :designation, 0

  field :tier, 1, type: Flyteidl.Core.QualityOfService.Tier, enum: true, oneof: 0
  field :spec, 2, type: Flyteidl.Core.QualityOfServiceSpec, oneof: 0
end