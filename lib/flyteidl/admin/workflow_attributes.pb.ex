defmodule Flyteidl.Admin.WorkflowAttributes do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :project, 1, type: :string
  field :domain, 2, type: :string
  field :workflow, 3, type: :string

  field :matching_attributes, 4,
    type: Flyteidl.Admin.MatchingAttributes,
    json_name: "matchingAttributes"
end

defmodule Flyteidl.Admin.WorkflowAttributesUpdateRequest do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :attributes, 1, type: Flyteidl.Admin.WorkflowAttributes
end

defmodule Flyteidl.Admin.WorkflowAttributesUpdateResponse do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"
end

defmodule Flyteidl.Admin.WorkflowAttributesGetRequest do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :project, 1, type: :string
  field :domain, 2, type: :string
  field :workflow, 3, type: :string

  field :resource_type, 4,
    type: Flyteidl.Admin.MatchableResource,
    json_name: "resourceType",
    enum: true
end

defmodule Flyteidl.Admin.WorkflowAttributesGetResponse do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :attributes, 1, type: Flyteidl.Admin.WorkflowAttributes
end

defmodule Flyteidl.Admin.WorkflowAttributesDeleteRequest do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :project, 1, type: :string
  field :domain, 2, type: :string
  field :workflow, 3, type: :string

  field :resource_type, 4,
    type: Flyteidl.Admin.MatchableResource,
    json_name: "resourceType",
    enum: true
end

defmodule Flyteidl.Admin.WorkflowAttributesDeleteResponse do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"
end