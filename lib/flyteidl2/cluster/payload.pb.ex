defmodule Flyteidl2.Cluster.SelectClusterRequest.Operation do
  @moduledoc false

  use Protobuf,
    enum: true,
    full_name: "flyteidl2.cluster.SelectClusterRequest.Operation",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :OPERATION_UNSPECIFIED, 0
  field :OPERATION_CREATE_UPLOAD_LOCATION, 1
  field :OPERATION_UPLOAD_INPUTS, 2
  field :OPERATION_GET_ACTION_DATA, 3
  field :OPERATION_QUERY_RANGE_METRICS, 4
  field :OPERATION_CREATE_DOWNLOAD_LINK, 5
  field :OPERATION_TAIL_LOGS, 6
  field :OPERATION_GET_ACTION_ATTEMPT_METRICS, 7
end

defmodule Flyteidl2.Cluster.SelectClusterRequest do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.cluster.SelectClusterRequest",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  oneof :resource, 0

  field :org_id, 1, type: Flyteidl2.Common.OrgIdentifier, json_name: "orgId", oneof: 0
  field :project_id, 2, type: Flyteidl2.Common.ProjectIdentifier, json_name: "projectId", oneof: 0
  field :task_id, 3, type: Flyteidl2.Task.TaskIdentifier, json_name: "taskId", oneof: 0
  field :action_id, 4, type: Flyteidl2.Common.ActionIdentifier, json_name: "actionId", oneof: 0

  field :action_attempt_id, 5,
    type: Flyteidl2.Common.ActionAttemptIdentifier,
    json_name: "actionAttemptId",
    oneof: 0

  field :app_id, 6, type: Flyteidl2.App.Identifier, json_name: "appId", oneof: 0

  field :operation, 8,
    type: Flyteidl2.Cluster.SelectClusterRequest.Operation,
    enum: true,
    deprecated: false
end

defmodule Flyteidl2.Cluster.SelectClusterResponse do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.cluster.SelectClusterResponse",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :cluster_endpoint, 1, type: :string, json_name: "clusterEndpoint"
end
