defmodule Flyteidl.Admin.TaskCreateRequest do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :id, 1, type: Flyteidl.Core.Identifier
  field :spec, 2, type: Flyteidl.Admin.TaskSpec
end

defmodule Flyteidl.Admin.TaskCreateResponse do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"
end

defmodule Flyteidl.Admin.Task do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :id, 1, type: Flyteidl.Core.Identifier
  field :closure, 2, type: Flyteidl.Admin.TaskClosure
  field :short_description, 3, type: :string, json_name: "shortDescription"
end

defmodule Flyteidl.Admin.TaskList do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :tasks, 1, repeated: true, type: Flyteidl.Admin.Task
  field :token, 2, type: :string
end

defmodule Flyteidl.Admin.TaskSpec do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :template, 1, type: Flyteidl.Core.TaskTemplate
  field :description, 2, type: Flyteidl.Admin.DescriptionEntity
end

defmodule Flyteidl.Admin.TaskClosure do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :compiled_task, 1, type: Flyteidl.Core.CompiledTask, json_name: "compiledTask"
  field :created_at, 2, type: Google.Protobuf.Timestamp, json_name: "createdAt"
end