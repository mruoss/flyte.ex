defmodule Flyteidl2.Core.WorkflowExecution.Phase do
  @moduledoc false

  use Protobuf,
    enum: true,
    full_name: "flyteidl2.core.WorkflowExecution.Phase",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

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

defmodule Flyteidl2.Core.NodeExecution.Phase do
  @moduledoc false

  use Protobuf,
    enum: true,
    full_name: "flyteidl2.core.NodeExecution.Phase",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

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

defmodule Flyteidl2.Core.TaskExecution.Phase do
  @moduledoc false

  use Protobuf,
    enum: true,
    full_name: "flyteidl2.core.TaskExecution.Phase",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :UNDEFINED, 0
  field :QUEUED, 1
  field :RUNNING, 2
  field :SUCCEEDED, 3
  field :ABORTED, 4
  field :FAILED, 5
  field :INITIALIZING, 6
  field :WAITING_FOR_RESOURCES, 7
  field :RETRYABLE_FAILED, 8
end

defmodule Flyteidl2.Core.ExecutionError.ErrorKind do
  @moduledoc false

  use Protobuf,
    enum: true,
    full_name: "flyteidl2.core.ExecutionError.ErrorKind",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :UNKNOWN, 0
  field :USER, 1
  field :SYSTEM, 2
end

defmodule Flyteidl2.Core.TaskLog.MessageFormat do
  @moduledoc false

  use Protobuf,
    enum: true,
    full_name: "flyteidl2.core.TaskLog.MessageFormat",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :UNKNOWN, 0
  field :CSV, 1
  field :JSON, 2
end

defmodule Flyteidl2.Core.TaskLog.LinkType do
  @moduledoc false

  use Protobuf,
    enum: true,
    full_name: "flyteidl2.core.TaskLog.LinkType",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :EXTERNAL, 0
  field :DASHBOARD, 1
  field :IDE, 2
end

defmodule Flyteidl2.Core.QualityOfService.Tier do
  @moduledoc false

  use Protobuf,
    enum: true,
    full_name: "flyteidl2.core.QualityOfService.Tier",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :UNDEFINED, 0
  field :HIGH, 1
  field :MEDIUM, 2
  field :LOW, 3
end

defmodule Flyteidl2.Core.WorkflowExecution do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.core.WorkflowExecution",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3
end

defmodule Flyteidl2.Core.NodeExecution do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.core.NodeExecution",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3
end

defmodule Flyteidl2.Core.TaskExecution do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.core.TaskExecution",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3
end

defmodule Flyteidl2.Core.ExecutionError do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.core.ExecutionError",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :code, 1, type: :string
  field :message, 2, type: :string
  field :error_uri, 3, type: :string, json_name: "errorUri"
  field :kind, 4, type: Flyteidl2.Core.ExecutionError.ErrorKind, enum: true
  field :timestamp, 5, type: Google.Protobuf.Timestamp
  field :worker, 6, type: :string
end

defmodule Flyteidl2.Core.TaskLog do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.core.TaskLog",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :uri, 1, type: :string
  field :name, 2, type: :string

  field :message_format, 3,
    type: Flyteidl2.Core.TaskLog.MessageFormat,
    json_name: "messageFormat",
    enum: true

  field :ttl, 4, type: Google.Protobuf.Duration
  field :ShowWhilePending, 5, type: :bool
  field :HideOnceFinished, 6, type: :bool
  field :link_type, 7, type: Flyteidl2.Core.TaskLog.LinkType, json_name: "linkType", enum: true
  field :ready, 8, type: :bool
  field :icon_uri, 9, type: :string, json_name: "iconUri"
end

defmodule Flyteidl2.Core.LogContext do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.core.LogContext",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :pods, 1, repeated: true, type: Flyteidl2.Core.PodLogContext
  field :primary_pod_name, 2, type: :string, json_name: "primaryPodName"
end

defmodule Flyteidl2.Core.PodLogContext do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.core.PodLogContext",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :namespace, 1, type: :string
  field :pod_name, 2, type: :string, json_name: "podName"
  field :containers, 3, repeated: true, type: Flyteidl2.Core.ContainerContext
  field :primary_container_name, 4, type: :string, json_name: "primaryContainerName"

  field :init_containers, 5,
    repeated: true,
    type: Flyteidl2.Core.ContainerContext,
    json_name: "initContainers"
end

defmodule Flyteidl2.Core.ContainerContext.ProcessContext do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.core.ContainerContext.ProcessContext",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :container_start_time, 1, type: Google.Protobuf.Timestamp, json_name: "containerStartTime"
  field :container_end_time, 2, type: Google.Protobuf.Timestamp, json_name: "containerEndTime"
end

defmodule Flyteidl2.Core.ContainerContext do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.core.ContainerContext",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :container_name, 1, type: :string, json_name: "containerName"
  field :process, 2, type: Flyteidl2.Core.ContainerContext.ProcessContext
end

defmodule Flyteidl2.Core.QualityOfServiceSpec do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.core.QualityOfServiceSpec",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :queueing_budget, 1, type: Google.Protobuf.Duration, json_name: "queueingBudget"
end

defmodule Flyteidl2.Core.QualityOfService do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.core.QualityOfService",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  oneof :designation, 0

  field :tier, 1, type: Flyteidl2.Core.QualityOfService.Tier, enum: true, oneof: 0
  field :spec, 2, type: Flyteidl2.Core.QualityOfServiceSpec, oneof: 0
end
