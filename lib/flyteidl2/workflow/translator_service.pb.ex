defmodule Flyteidl2.Workflow.LiteralsToLaunchFormJsonRequest do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.workflow.LiteralsToLaunchFormJsonRequest",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :literals, 1, repeated: true, type: Flyteidl2.Task.NamedLiteral
  field :variables, 2, type: Flyteidl2.Core.VariableMap
end

defmodule Flyteidl2.Workflow.LiteralsToLaunchFormJsonResponse do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.workflow.LiteralsToLaunchFormJsonResponse",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :json, 1, type: Google.Protobuf.Struct
end

defmodule Flyteidl2.Workflow.LaunchFormJsonToLiteralsRequest do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.workflow.LaunchFormJsonToLiteralsRequest",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :json, 1, type: Google.Protobuf.Struct
end

defmodule Flyteidl2.Workflow.LaunchFormJsonToLiteralsResponse do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.workflow.LaunchFormJsonToLiteralsResponse",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :literals, 1, repeated: true, type: Flyteidl2.Task.NamedLiteral
end

defmodule Flyteidl2.Workflow.TaskSpecToLaunchFormJsonRequest do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.workflow.TaskSpecToLaunchFormJsonRequest",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :task_spec, 1, type: Flyteidl2.Task.TaskSpec, json_name: "taskSpec"
end

defmodule Flyteidl2.Workflow.TaskSpecToLaunchFormJsonResponse do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.workflow.TaskSpecToLaunchFormJsonResponse",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :json, 1, type: Google.Protobuf.Struct
end

defmodule Flyteidl2.Workflow.JsonValuesToLiteralsRequest do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.workflow.JsonValuesToLiteralsRequest",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :variables, 1, type: Flyteidl2.Core.VariableMap
  field :values, 2, type: Google.Protobuf.Struct
end

defmodule Flyteidl2.Workflow.JsonValuesToLiteralsResponse do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.workflow.JsonValuesToLiteralsResponse",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :literals, 1, repeated: true, type: Flyteidl2.Task.NamedLiteral
end

defmodule Flyteidl2.Workflow.TranslatorService.Service do
  @moduledoc false

  use GRPC.Service,
    name: "flyteidl2.workflow.TranslatorService",
    protoc_gen_elixir_version: "0.16.0"

  rpc :LiteralsToLaunchFormJson,
      Flyteidl2.Workflow.LiteralsToLaunchFormJsonRequest,
      Flyteidl2.Workflow.LiteralsToLaunchFormJsonResponse

  rpc :LaunchFormJsonToLiterals,
      Flyteidl2.Workflow.LaunchFormJsonToLiteralsRequest,
      Flyteidl2.Workflow.LaunchFormJsonToLiteralsResponse

  rpc :TaskSpecToLaunchFormJson,
      Flyteidl2.Workflow.TaskSpecToLaunchFormJsonRequest,
      Flyteidl2.Workflow.TaskSpecToLaunchFormJsonResponse

  rpc :JsonValuesToLiterals,
      Flyteidl2.Workflow.JsonValuesToLiteralsRequest,
      Flyteidl2.Workflow.JsonValuesToLiteralsResponse
end

defmodule Flyteidl2.Workflow.TranslatorService.Stub do
  @moduledoc false

  use GRPC.Stub, service: Flyteidl2.Workflow.TranslatorService.Service
end
