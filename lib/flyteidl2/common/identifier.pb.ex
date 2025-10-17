defmodule Flyteidl2.Common.ProjectIdentifier do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.15.0", syntax: :proto3

  field :organization, 1, type: :string, deprecated: false
  field :domain, 2, type: :string, deprecated: false
  field :name, 3, type: :string, deprecated: false
end

defmodule Flyteidl2.Common.ClusterIdentifier do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.15.0", syntax: :proto3

  field :organization, 1, type: :string
  field :name, 2, type: :string, deprecated: false
end

defmodule Flyteidl2.Common.ClusterPoolIdentifier do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.15.0", syntax: :proto3

  field :organization, 1, type: :string
  field :name, 2, type: :string
end

defmodule Flyteidl2.Common.ClusterConfigIdentifier do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.15.0", syntax: :proto3

  field :organization, 1, type: :string, deprecated: false
  field :id, 2, type: :string, deprecated: false
end

defmodule Flyteidl2.Common.ClusterNodepoolIdentifier do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.15.0", syntax: :proto3

  field :organization, 1, type: :string
  field :cluster_name, 2, type: :string, json_name: "clusterName", deprecated: false
  field :name, 3, type: :string, deprecated: false
end

defmodule Flyteidl2.Common.UserIdentifier do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.15.0", syntax: :proto3

  field :subject, 1, type: :string, deprecated: false
end

defmodule Flyteidl2.Common.ApplicationIdentifier do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.15.0", syntax: :proto3

  field :subject, 1, type: :string, deprecated: false
end

defmodule Flyteidl2.Common.RoleIdentifier do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.15.0", syntax: :proto3

  field :organization, 1, type: :string
  field :name, 2, type: :string, deprecated: false
end

defmodule Flyteidl2.Common.OrgIdentifier do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.15.0", syntax: :proto3

  field :name, 1, type: :string, deprecated: false
end

defmodule Flyteidl2.Common.ManagedClusterIdentifier do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.15.0", syntax: :proto3

  field :name, 2, type: :string, deprecated: false
  field :org, 3, type: Flyteidl2.Common.OrgIdentifier, deprecated: false
end

defmodule Flyteidl2.Common.PolicyIdentifier do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.15.0", syntax: :proto3

  field :organization, 1, type: :string
  field :name, 2, type: :string, deprecated: false
end

defmodule Flyteidl2.Common.RunIdentifier do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.15.0", syntax: :proto3

  field :org, 1, type: :string, deprecated: false
  field :project, 2, type: :string, deprecated: false
  field :domain, 3, type: :string, deprecated: false
  field :name, 4, type: :string, deprecated: false
end

defmodule Flyteidl2.Common.ActionIdentifier do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.15.0", syntax: :proto3

  field :run, 1, type: Flyteidl2.Common.RunIdentifier, deprecated: false
  field :name, 2, type: :string, deprecated: false
end

defmodule Flyteidl2.Common.ActionAttemptIdentifier do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.15.0", syntax: :proto3

  field :action_id, 1,
    type: Flyteidl2.Common.ActionIdentifier,
    json_name: "actionId",
    deprecated: false

  field :attempt, 2, type: :uint32, deprecated: false
end

defmodule Flyteidl2.Common.TriggerName do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.15.0", syntax: :proto3

  field :org, 1, type: :string, deprecated: false
  field :project, 2, type: :string, deprecated: false
  field :domain, 3, type: :string, deprecated: false
  field :name, 4, type: :string, deprecated: false
  field :task_name, 5, type: :string, json_name: "taskName", deprecated: false
end

defmodule Flyteidl2.Common.TriggerIdentifier do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.15.0", syntax: :proto3

  field :name, 1, type: Flyteidl2.Common.TriggerName, deprecated: false
  field :revision, 2, type: :uint64, deprecated: false
end
