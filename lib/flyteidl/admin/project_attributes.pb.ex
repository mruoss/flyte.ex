defmodule Flyteidl.Admin.ProjectAttributes do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :project, 1, type: :string

  field :matching_attributes, 2,
    type: Flyteidl.Admin.MatchingAttributes,
    json_name: "matchingAttributes"
end

defmodule Flyteidl.Admin.ProjectAttributesUpdateRequest do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :attributes, 1, type: Flyteidl.Admin.ProjectAttributes
end

defmodule Flyteidl.Admin.ProjectAttributesUpdateResponse do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"
end

defmodule Flyteidl.Admin.ProjectAttributesGetRequest do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :project, 1, type: :string

  field :resource_type, 2,
    type: Flyteidl.Admin.MatchableResource,
    json_name: "resourceType",
    enum: true
end

defmodule Flyteidl.Admin.ProjectAttributesGetResponse do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :attributes, 1, type: Flyteidl.Admin.ProjectAttributes
end

defmodule Flyteidl.Admin.ProjectAttributesDeleteRequest do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :project, 1, type: :string

  field :resource_type, 2,
    type: Flyteidl.Admin.MatchableResource,
    json_name: "resourceType",
    enum: true
end

defmodule Flyteidl.Admin.ProjectAttributesDeleteResponse do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"
end