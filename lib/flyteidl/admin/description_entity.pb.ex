defmodule Flyteidl.Admin.DescriptionFormat do
  @moduledoc false

  use Protobuf, enum: true, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :DESCRIPTION_FORMAT_UNKNOWN, 0
  field :DESCRIPTION_FORMAT_MARKDOWN, 1
  field :DESCRIPTION_FORMAT_HTML, 2
  field :DESCRIPTION_FORMAT_RST, 3
end

defmodule Flyteidl.Admin.DescriptionEntity do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :id, 1, type: Flyteidl.Core.Identifier
  field :short_description, 2, type: :string, json_name: "shortDescription"
  field :long_description, 3, type: Flyteidl.Admin.Description, json_name: "longDescription"
  field :source_code, 4, type: Flyteidl.Admin.SourceCode, json_name: "sourceCode"
  field :tags, 5, repeated: true, type: :string
end

defmodule Flyteidl.Admin.Description do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  oneof :content, 0

  field :value, 1, type: :string, oneof: 0
  field :uri, 2, type: :string, oneof: 0
  field :format, 3, type: Flyteidl.Admin.DescriptionFormat, enum: true
  field :icon_link, 4, type: :string, json_name: "iconLink"
end

defmodule Flyteidl.Admin.SourceCode do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :link, 1, type: :string
end

defmodule Flyteidl.Admin.DescriptionEntityList do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :descriptionEntities, 1, repeated: true, type: Flyteidl.Admin.DescriptionEntity
  field :token, 2, type: :string
end

defmodule Flyteidl.Admin.DescriptionEntityListRequest do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :resource_type, 1, type: Flyteidl.Core.ResourceType, json_name: "resourceType", enum: true
  field :id, 2, type: Flyteidl.Admin.NamedEntityIdentifier
  field :limit, 3, type: :uint32
  field :token, 4, type: :string
  field :filters, 5, type: :string
  field :sort_by, 6, type: Flyteidl.Admin.Sort, json_name: "sortBy"
end