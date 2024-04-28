defmodule Flyteidl.Admin.Project.ProjectState do
  @moduledoc false

  use Protobuf, enum: true, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :ACTIVE, 0
  field :ARCHIVED, 1
  field :SYSTEM_GENERATED, 2
end

defmodule Flyteidl.Admin.Domain do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :id, 1, type: :string
  field :name, 2, type: :string
end

defmodule Flyteidl.Admin.Project do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :id, 1, type: :string
  field :name, 2, type: :string
  field :domains, 3, repeated: true, type: Flyteidl.Admin.Domain
  field :description, 4, type: :string
  field :labels, 5, type: Flyteidl.Admin.Labels
  field :state, 6, type: Flyteidl.Admin.Project.ProjectState, enum: true
end

defmodule Flyteidl.Admin.Projects do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :projects, 1, repeated: true, type: Flyteidl.Admin.Project
  field :token, 2, type: :string
end

defmodule Flyteidl.Admin.ProjectListRequest do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :limit, 1, type: :uint32
  field :token, 2, type: :string
  field :filters, 3, type: :string
  field :sort_by, 4, type: Flyteidl.Admin.Sort, json_name: "sortBy"
end

defmodule Flyteidl.Admin.ProjectRegisterRequest do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :project, 1, type: Flyteidl.Admin.Project
end

defmodule Flyteidl.Admin.ProjectRegisterResponse do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"
end

defmodule Flyteidl.Admin.ProjectUpdateResponse do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"
end