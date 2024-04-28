defmodule Flyteidl.Admin.WorkflowCreateRequest do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :id, 1, type: Flyteidl.Core.Identifier
  field :spec, 2, type: Flyteidl.Admin.WorkflowSpec
end

defmodule Flyteidl.Admin.WorkflowCreateResponse do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"
end

defmodule Flyteidl.Admin.Workflow do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :id, 1, type: Flyteidl.Core.Identifier
  field :closure, 2, type: Flyteidl.Admin.WorkflowClosure
  field :short_description, 3, type: :string, json_name: "shortDescription"
end

defmodule Flyteidl.Admin.WorkflowList do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :workflows, 1, repeated: true, type: Flyteidl.Admin.Workflow
  field :token, 2, type: :string
end

defmodule Flyteidl.Admin.WorkflowSpec do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :template, 1, type: Flyteidl.Core.WorkflowTemplate

  field :sub_workflows, 2,
    repeated: true,
    type: Flyteidl.Core.WorkflowTemplate,
    json_name: "subWorkflows"

  field :description, 3, type: Flyteidl.Admin.DescriptionEntity
end

defmodule Flyteidl.Admin.WorkflowClosure do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :compiled_workflow, 1,
    type: Flyteidl.Core.CompiledWorkflowClosure,
    json_name: "compiledWorkflow"

  field :created_at, 2, type: Google.Protobuf.Timestamp, json_name: "createdAt"
end

defmodule Flyteidl.Admin.WorkflowErrorExistsDifferentStructure do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :id, 1, type: Flyteidl.Core.Identifier
end

defmodule Flyteidl.Admin.WorkflowErrorExistsIdenticalStructure do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :id, 1, type: Flyteidl.Core.Identifier
end

defmodule Flyteidl.Admin.CreateWorkflowFailureReason do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  oneof :reason, 0

  field :exists_different_structure, 1,
    type: Flyteidl.Admin.WorkflowErrorExistsDifferentStructure,
    json_name: "existsDifferentStructure",
    oneof: 0

  field :exists_identical_structure, 2,
    type: Flyteidl.Admin.WorkflowErrorExistsIdenticalStructure,
    json_name: "existsIdenticalStructure",
    oneof: 0
end