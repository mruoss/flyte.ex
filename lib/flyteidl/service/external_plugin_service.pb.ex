defmodule Flyteidl.Service.State do
  @moduledoc false

  use Protobuf, enum: true, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :RETRYABLE_FAILURE, 0
  field :PERMANENT_FAILURE, 1
  field :PENDING, 2
  field :RUNNING, 3
  field :SUCCEEDED, 4
end

defmodule Flyteidl.Service.TaskCreateRequest do
  @moduledoc false

  use Protobuf, deprecated: true, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :inputs, 1, type: Flyteidl.Core.LiteralMap
  field :template, 2, type: Flyteidl.Core.TaskTemplate
  field :output_prefix, 3, type: :string, json_name: "outputPrefix"
end

defmodule Flyteidl.Service.TaskCreateResponse do
  @moduledoc false

  use Protobuf, deprecated: true, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :job_id, 1, type: :string, json_name: "jobId"
end

defmodule Flyteidl.Service.TaskGetRequest do
  @moduledoc false

  use Protobuf, deprecated: true, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :task_type, 1, type: :string, json_name: "taskType"
  field :job_id, 2, type: :string, json_name: "jobId"
end

defmodule Flyteidl.Service.TaskGetResponse do
  @moduledoc false

  use Protobuf, deprecated: true, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :state, 1, type: Flyteidl.Service.State, enum: true
  field :outputs, 2, type: Flyteidl.Core.LiteralMap
end

defmodule Flyteidl.Service.TaskDeleteRequest do
  @moduledoc false

  use Protobuf, deprecated: true, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :task_type, 1, type: :string, json_name: "taskType"
  field :job_id, 2, type: :string, json_name: "jobId"
end

defmodule Flyteidl.Service.TaskDeleteResponse do
  @moduledoc false

  use Protobuf, deprecated: true, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"
end

defmodule Flyteidl.Service.ExternalPluginService.Service do
  @moduledoc false

  use GRPC.Service,
    name: "flyteidl.service.ExternalPluginService",
    protoc_gen_elixir_version: "0.12.0"

  rpc :CreateTask, Flyteidl.Service.TaskCreateRequest, Flyteidl.Service.TaskCreateResponse

  rpc :GetTask, Flyteidl.Service.TaskGetRequest, Flyteidl.Service.TaskGetResponse

  rpc :DeleteTask, Flyteidl.Service.TaskDeleteRequest, Flyteidl.Service.TaskDeleteResponse
end

defmodule Flyteidl.Service.ExternalPluginService.Stub do
  @moduledoc false

  use GRPC.Stub, service: Flyteidl.Service.ExternalPluginService.Service
end