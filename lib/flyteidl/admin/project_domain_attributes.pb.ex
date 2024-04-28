defmodule Flyteidl.Admin.ProjectDomainAttributes do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :project, 1, type: :string
  field :domain, 2, type: :string

  field :matching_attributes, 3,
    type: Flyteidl.Admin.MatchingAttributes,
    json_name: "matchingAttributes"
end

defmodule Flyteidl.Admin.ProjectDomainAttributesUpdateRequest do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :attributes, 1, type: Flyteidl.Admin.ProjectDomainAttributes
end

defmodule Flyteidl.Admin.ProjectDomainAttributesUpdateResponse do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"
end

defmodule Flyteidl.Admin.ProjectDomainAttributesGetRequest do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :project, 1, type: :string
  field :domain, 2, type: :string

  field :resource_type, 3,
    type: Flyteidl.Admin.MatchableResource,
    json_name: "resourceType",
    enum: true
end

defmodule Flyteidl.Admin.ProjectDomainAttributesGetResponse do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :attributes, 1, type: Flyteidl.Admin.ProjectDomainAttributes
end

defmodule Flyteidl.Admin.ProjectDomainAttributesDeleteRequest do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :project, 1, type: :string
  field :domain, 2, type: :string

  field :resource_type, 3,
    type: Flyteidl.Admin.MatchableResource,
    json_name: "resourceType",
    enum: true
end

defmodule Flyteidl.Admin.ProjectDomainAttributesDeleteResponse do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"
end