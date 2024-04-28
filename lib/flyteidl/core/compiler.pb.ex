defmodule Flyteidl.Core.ConnectionSet.IdList do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :ids, 1, repeated: true, type: :string
end

defmodule Flyteidl.Core.ConnectionSet.DownstreamEntry do
  @moduledoc false

  use Protobuf, map: true, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :key, 1, type: :string
  field :value, 2, type: Flyteidl.Core.ConnectionSet.IdList
end

defmodule Flyteidl.Core.ConnectionSet.UpstreamEntry do
  @moduledoc false

  use Protobuf, map: true, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :key, 1, type: :string
  field :value, 2, type: Flyteidl.Core.ConnectionSet.IdList
end

defmodule Flyteidl.Core.ConnectionSet do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :downstream, 7,
    repeated: true,
    type: Flyteidl.Core.ConnectionSet.DownstreamEntry,
    map: true

  field :upstream, 8, repeated: true, type: Flyteidl.Core.ConnectionSet.UpstreamEntry, map: true
end

defmodule Flyteidl.Core.CompiledWorkflow do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :template, 1, type: Flyteidl.Core.WorkflowTemplate
  field :connections, 2, type: Flyteidl.Core.ConnectionSet
end

defmodule Flyteidl.Core.CompiledTask do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :template, 1, type: Flyteidl.Core.TaskTemplate
end

defmodule Flyteidl.Core.CompiledWorkflowClosure do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :primary, 1, type: Flyteidl.Core.CompiledWorkflow

  field :sub_workflows, 2,
    repeated: true,
    type: Flyteidl.Core.CompiledWorkflow,
    json_name: "subWorkflows"

  field :tasks, 3, repeated: true, type: Flyteidl.Core.CompiledTask
end