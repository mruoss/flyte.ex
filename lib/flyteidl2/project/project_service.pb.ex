defmodule Flyteidl2.Project.ProjectState do
  @moduledoc false

  use Protobuf,
    enum: true,
    full_name: "flyteidl2.project.ProjectState",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :PROJECT_STATE_ACTIVE, 0
  field :PROJECT_STATE_ARCHIVED, 1
  field :PROJECT_STATE_SYSTEM_GENERATED, 2
  field :PROJECT_STATE_SYSTEM_ARCHIVED, 3
end

defmodule Flyteidl2.Project.Domain do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.project.Domain",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :id, 1, type: :string
  field :name, 2, type: :string
end

defmodule Flyteidl2.Project.Project do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.project.Project",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :id, 1, type: :string
  field :name, 2, type: :string
  field :domains, 3, repeated: true, type: Flyteidl2.Project.Domain
  field :description, 4, type: :string
  field :labels, 5, type: Flyteidl2.Task.Labels
  field :state, 6, type: Flyteidl2.Project.ProjectState, enum: true
  field :org, 7, type: :string
end

defmodule Flyteidl2.Project.Projects do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.project.Projects",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :projects, 1, repeated: true, type: Flyteidl2.Project.Project
  field :token, 2, type: :string
end

defmodule Flyteidl2.Project.CreateProjectRequest do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.project.CreateProjectRequest",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :project, 1, type: Flyteidl2.Project.Project
end

defmodule Flyteidl2.Project.CreateProjectResponse do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.project.CreateProjectResponse",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3
end

defmodule Flyteidl2.Project.UpdateProjectRequest do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.project.UpdateProjectRequest",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :project, 1, type: Flyteidl2.Project.Project
end

defmodule Flyteidl2.Project.UpdateProjectResponse do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.project.UpdateProjectResponse",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3
end

defmodule Flyteidl2.Project.GetProjectRequest do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.project.GetProjectRequest",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :id, 1, type: :string
  field :org, 2, type: :string
end

defmodule Flyteidl2.Project.GetProjectResponse do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.project.GetProjectResponse",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :project, 1, type: Flyteidl2.Project.Project
end

defmodule Flyteidl2.Project.ListProjectsRequest do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.project.ListProjectsRequest",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :limit, 1, type: :uint32
  field :token, 2, type: :string
  field :filters, 3, type: :string
  field :sort_by, 4, type: Flyteidl2.Common.Sort, json_name: "sortBy"
  field :org, 5, type: :string
end

defmodule Flyteidl2.Project.ListProjectsResponse do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.project.ListProjectsResponse",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :projects, 1, type: Flyteidl2.Project.Projects
end

defmodule Flyteidl2.Project.ProjectService.Service do
  @moduledoc false

  use GRPC.Service, name: "flyteidl2.project.ProjectService", protoc_gen_elixir_version: "0.16.0"

  rpc :CreateProject,
      Flyteidl2.Project.CreateProjectRequest,
      Flyteidl2.Project.CreateProjectResponse

  rpc :UpdateProject,
      Flyteidl2.Project.UpdateProjectRequest,
      Flyteidl2.Project.UpdateProjectResponse

  rpc :GetProject, Flyteidl2.Project.GetProjectRequest, Flyteidl2.Project.GetProjectResponse

  rpc :ListProjects, Flyteidl2.Project.ListProjectsRequest, Flyteidl2.Project.ListProjectsResponse
end

defmodule Flyteidl2.Project.ProjectService.Stub do
  @moduledoc false

  use GRPC.Stub, service: Flyteidl2.Project.ProjectService.Service
end
