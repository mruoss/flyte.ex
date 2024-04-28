defmodule Flyteidl.Admin.NamedEntityState do
  @moduledoc false

  use Protobuf, enum: true, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :NAMED_ENTITY_ACTIVE, 0
  field :NAMED_ENTITY_ARCHIVED, 1
  field :SYSTEM_GENERATED, 2
end

defmodule Flyteidl.Admin.Sort.Direction do
  @moduledoc false

  use Protobuf, enum: true, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :DESCENDING, 0
  field :ASCENDING, 1
end

defmodule Flyteidl.Admin.NamedEntityIdentifier do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :project, 1, type: :string
  field :domain, 2, type: :string
  field :name, 3, type: :string
end

defmodule Flyteidl.Admin.NamedEntityMetadata do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :description, 1, type: :string
  field :state, 2, type: Flyteidl.Admin.NamedEntityState, enum: true
end

defmodule Flyteidl.Admin.NamedEntity do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :resource_type, 1, type: Flyteidl.Core.ResourceType, json_name: "resourceType", enum: true
  field :id, 2, type: Flyteidl.Admin.NamedEntityIdentifier
  field :metadata, 3, type: Flyteidl.Admin.NamedEntityMetadata
end

defmodule Flyteidl.Admin.Sort do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :key, 1, type: :string
  field :direction, 2, type: Flyteidl.Admin.Sort.Direction, enum: true
end

defmodule Flyteidl.Admin.NamedEntityIdentifierListRequest do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :project, 1, type: :string
  field :domain, 2, type: :string
  field :limit, 3, type: :uint32
  field :token, 4, type: :string
  field :sort_by, 5, type: Flyteidl.Admin.Sort, json_name: "sortBy"
  field :filters, 6, type: :string
end

defmodule Flyteidl.Admin.NamedEntityListRequest do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :resource_type, 1, type: Flyteidl.Core.ResourceType, json_name: "resourceType", enum: true
  field :project, 2, type: :string
  field :domain, 3, type: :string
  field :limit, 4, type: :uint32
  field :token, 5, type: :string
  field :sort_by, 6, type: Flyteidl.Admin.Sort, json_name: "sortBy"
  field :filters, 7, type: :string
end

defmodule Flyteidl.Admin.NamedEntityIdentifierList do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :entities, 1, repeated: true, type: Flyteidl.Admin.NamedEntityIdentifier
  field :token, 2, type: :string
end

defmodule Flyteidl.Admin.NamedEntityList do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :entities, 1, repeated: true, type: Flyteidl.Admin.NamedEntity
  field :token, 2, type: :string
end

defmodule Flyteidl.Admin.NamedEntityGetRequest do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :resource_type, 1, type: Flyteidl.Core.ResourceType, json_name: "resourceType", enum: true
  field :id, 2, type: Flyteidl.Admin.NamedEntityIdentifier
end

defmodule Flyteidl.Admin.NamedEntityUpdateRequest do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :resource_type, 1, type: Flyteidl.Core.ResourceType, json_name: "resourceType", enum: true
  field :id, 2, type: Flyteidl.Admin.NamedEntityIdentifier
  field :metadata, 3, type: Flyteidl.Admin.NamedEntityMetadata
end

defmodule Flyteidl.Admin.NamedEntityUpdateResponse do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"
end

defmodule Flyteidl.Admin.ObjectGetRequest do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :id, 1, type: Flyteidl.Core.Identifier
end

defmodule Flyteidl.Admin.ResourceListRequest do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :id, 1, type: Flyteidl.Admin.NamedEntityIdentifier
  field :limit, 2, type: :uint32
  field :token, 3, type: :string
  field :filters, 4, type: :string
  field :sort_by, 5, type: Flyteidl.Admin.Sort, json_name: "sortBy"
end

defmodule Flyteidl.Admin.EmailNotification do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :recipients_email, 1, repeated: true, type: :string, json_name: "recipientsEmail"
end

defmodule Flyteidl.Admin.PagerDutyNotification do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :recipients_email, 1, repeated: true, type: :string, json_name: "recipientsEmail"
end

defmodule Flyteidl.Admin.SlackNotification do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :recipients_email, 1, repeated: true, type: :string, json_name: "recipientsEmail"
end

defmodule Flyteidl.Admin.Notification do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  oneof :type, 0

  field :phases, 1, repeated: true, type: Flyteidl.Core.WorkflowExecution.Phase, enum: true
  field :email, 2, type: Flyteidl.Admin.EmailNotification, oneof: 0

  field :pager_duty, 3,
    type: Flyteidl.Admin.PagerDutyNotification,
    json_name: "pagerDuty",
    oneof: 0

  field :slack, 4, type: Flyteidl.Admin.SlackNotification, oneof: 0
end

defmodule Flyteidl.Admin.UrlBlob do
  @moduledoc false

  use Protobuf, deprecated: true, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :url, 1, type: :string
  field :bytes, 2, type: :int64
end

defmodule Flyteidl.Admin.Labels.ValuesEntry do
  @moduledoc false

  use Protobuf, map: true, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :key, 1, type: :string
  field :value, 2, type: :string
end

defmodule Flyteidl.Admin.Labels do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :values, 1, repeated: true, type: Flyteidl.Admin.Labels.ValuesEntry, map: true
end

defmodule Flyteidl.Admin.Annotations.ValuesEntry do
  @moduledoc false

  use Protobuf, map: true, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :key, 1, type: :string
  field :value, 2, type: :string
end

defmodule Flyteidl.Admin.Annotations do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :values, 1, repeated: true, type: Flyteidl.Admin.Annotations.ValuesEntry, map: true
end

defmodule Flyteidl.Admin.Envs do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :values, 1, repeated: true, type: Flyteidl.Core.KeyValuePair
end

defmodule Flyteidl.Admin.AuthRole do
  @moduledoc false

  use Protobuf, deprecated: true, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :assumable_iam_role, 1, type: :string, json_name: "assumableIamRole"
  field :kubernetes_service_account, 2, type: :string, json_name: "kubernetesServiceAccount"
end

defmodule Flyteidl.Admin.RawOutputDataConfig do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :output_location_prefix, 1, type: :string, json_name: "outputLocationPrefix"
end

defmodule Flyteidl.Admin.FlyteURLs do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :inputs, 1, type: :string
  field :outputs, 2, type: :string
  field :deck, 3, type: :string
end