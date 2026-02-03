defmodule Flyteidl2.App.CreateRequest do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.app.CreateRequest",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :app, 1, type: Flyteidl2.App.App, deprecated: false
end

defmodule Flyteidl2.App.CreateResponse do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.app.CreateResponse",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :app, 1, type: Flyteidl2.App.App
end

defmodule Flyteidl2.App.GetRequest do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.app.GetRequest",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  oneof :identifier, 0

  field :app_id, 1, type: Flyteidl2.App.Identifier, json_name: "appId", oneof: 0
  field :ingress, 2, type: Flyteidl2.App.Ingress, oneof: 0
end

defmodule Flyteidl2.App.GetResponse do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.app.GetResponse",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :app, 1, type: Flyteidl2.App.App
end

defmodule Flyteidl2.App.UpdateRequest do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.app.UpdateRequest",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :app, 1, type: Flyteidl2.App.App, deprecated: false
  field :reason, 2, type: :string, deprecated: false
end

defmodule Flyteidl2.App.UpdateResponse do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.app.UpdateResponse",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :app, 1, type: Flyteidl2.App.App
end

defmodule Flyteidl2.App.DeleteRequest do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.app.DeleteRequest",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :app_id, 1, type: Flyteidl2.App.Identifier, json_name: "appId", deprecated: false
end

defmodule Flyteidl2.App.DeleteResponse do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.app.DeleteResponse",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3
end

defmodule Flyteidl2.App.ListRequest do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.app.ListRequest",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  oneof :filter_by, 0

  field :request, 1, type: Flyteidl2.Common.ListRequest
  field :org, 2, type: :string, oneof: 0, deprecated: false
  field :cluster_id, 3, type: Flyteidl2.Common.ClusterIdentifier, json_name: "clusterId", oneof: 0
  field :project, 4, type: Flyteidl2.Common.ProjectIdentifier, oneof: 0
end

defmodule Flyteidl2.App.ListResponse do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.app.ListResponse",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :apps, 1, repeated: true, type: Flyteidl2.App.App
  field :token, 2, type: :string
end

defmodule Flyteidl2.App.WatchRequest do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.app.WatchRequest",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  oneof :target, 0

  field :org, 1, type: :string, oneof: 0, deprecated: false
  field :cluster_id, 2, type: Flyteidl2.Common.ClusterIdentifier, json_name: "clusterId", oneof: 0
  field :project, 3, type: Flyteidl2.Common.ProjectIdentifier, oneof: 0
  field :app_id, 4, type: Flyteidl2.App.Identifier, json_name: "appId", oneof: 0
end

defmodule Flyteidl2.App.CreateEvent do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.app.CreateEvent",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :app, 1, type: Flyteidl2.App.App
end

defmodule Flyteidl2.App.UpdateEvent do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.app.UpdateEvent",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :updated_app, 1, type: Flyteidl2.App.App, json_name: "updatedApp"
  field :old_app, 2, type: Flyteidl2.App.App, json_name: "oldApp"
end

defmodule Flyteidl2.App.DeleteEvent do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.app.DeleteEvent",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :app, 1, type: Flyteidl2.App.App
end

defmodule Flyteidl2.App.WatchResponse do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.app.WatchResponse",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  oneof :event, 0

  field :create_event, 1, type: Flyteidl2.App.CreateEvent, json_name: "createEvent", oneof: 0
  field :update_event, 2, type: Flyteidl2.App.UpdateEvent, json_name: "updateEvent", oneof: 0
  field :delete_event, 3, type: Flyteidl2.App.DeleteEvent, json_name: "deleteEvent", oneof: 0
end

defmodule Flyteidl2.App.UpdateStatusRequest do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.app.UpdateStatusRequest",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :app, 1, type: Flyteidl2.App.App, deprecated: false
end

defmodule Flyteidl2.App.UpdateStatusResponse do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.app.UpdateStatusResponse",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :app, 1, type: Flyteidl2.App.App
end

defmodule Flyteidl2.App.LeaseRequest do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.app.LeaseRequest",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :id, 1, type: Flyteidl2.Common.ClusterIdentifier, deprecated: false
end

defmodule Flyteidl2.App.LeaseResponse do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.app.LeaseResponse",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :apps, 1, repeated: true, type: Flyteidl2.App.App
end
