defmodule Flyteidl2.Dataproxy.ArtifactType do
  @moduledoc false

  use Protobuf,
    enum: true,
    full_name: "flyteidl2.dataproxy.ArtifactType",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :ARTIFACT_TYPE_UNSPECIFIED, 0
  field :ARTIFACT_TYPE_REPORT, 1
  field :ARTIFACT_TYPE_CODE_BUNDLE, 2
end

defmodule Flyteidl2.Dataproxy.CreateUploadLocationRequest do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.dataproxy.CreateUploadLocationRequest",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :project, 1, type: :string, deprecated: false
  field :domain, 2, type: :string, deprecated: false
  field :filename, 3, type: :string
  field :expires_in, 4, type: Google.Protobuf.Duration, json_name: "expiresIn"
  field :content_md5, 5, type: :bytes, json_name: "contentMd5", deprecated: false
  field :filename_root, 6, type: :string, json_name: "filenameRoot"
  field :add_content_md5_metadata, 7, type: :bool, json_name: "addContentMd5Metadata"
  field :org, 8, type: :string
  field :content_length, 9, type: :int64, json_name: "contentLength"
end

defmodule Flyteidl2.Dataproxy.CreateUploadLocationResponse.HeadersEntry do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.dataproxy.CreateUploadLocationResponse.HeadersEntry",
    map: true,
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :key, 1, type: :string
  field :value, 2, type: :string
end

defmodule Flyteidl2.Dataproxy.CreateUploadLocationResponse do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.dataproxy.CreateUploadLocationResponse",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :signed_url, 1, type: :string, json_name: "signedUrl"
  field :native_url, 2, type: :string, json_name: "nativeUrl"
  field :expires_at, 3, type: Google.Protobuf.Timestamp, json_name: "expiresAt"

  field :headers, 4,
    repeated: true,
    type: Flyteidl2.Dataproxy.CreateUploadLocationResponse.HeadersEntry,
    map: true
end

defmodule Flyteidl2.Dataproxy.UploadInputsRequest do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.dataproxy.UploadInputsRequest",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  oneof :id, 0

  oneof :task, 1

  field :run_id, 1, type: Flyteidl2.Common.RunIdentifier, json_name: "runId", oneof: 0
  field :project_id, 2, type: Flyteidl2.Common.ProjectIdentifier, json_name: "projectId", oneof: 0
  field :task_id, 3, type: Flyteidl2.Task.TaskIdentifier, json_name: "taskId", oneof: 1
  field :task_spec, 4, type: Flyteidl2.Task.TaskSpec, json_name: "taskSpec", oneof: 1
  field :trigger_name, 5, type: Flyteidl2.Common.TriggerName, json_name: "triggerName", oneof: 1
  field :inputs, 6, type: Flyteidl2.Task.Inputs
end

defmodule Flyteidl2.Dataproxy.UploadInputsResponse do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.dataproxy.UploadInputsResponse",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :offloaded_input_data, 1,
    type: Flyteidl2.Common.OffloadedInputData,
    json_name: "offloadedInputData"
end

defmodule Flyteidl2.Dataproxy.PreSignedURLs do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.dataproxy.PreSignedURLs",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :signed_url, 1, repeated: true, type: :string, json_name: "signedUrl"
  field :expires_at, 2, type: Google.Protobuf.Timestamp, json_name: "expiresAt"
end

defmodule Flyteidl2.Dataproxy.CreateDownloadLinkRequest do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.dataproxy.CreateDownloadLinkRequest",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  oneof :source, 0

  field :artifact_type, 1,
    type: Flyteidl2.Dataproxy.ArtifactType,
    json_name: "artifactType",
    enum: true,
    deprecated: false

  field :expires_in, 2, type: Google.Protobuf.Duration, json_name: "expiresIn"

  field :action_attempt_id, 3,
    type: Flyteidl2.Common.ActionAttemptIdentifier,
    json_name: "actionAttemptId",
    oneof: 0

  field :app_id, 4, type: Flyteidl2.App.Identifier, json_name: "appId", oneof: 0
  field :task_id, 5, type: Flyteidl2.Task.TaskIdentifier, json_name: "taskId", oneof: 0
end

defmodule Flyteidl2.Dataproxy.CreateDownloadLinkResponse do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.dataproxy.CreateDownloadLinkResponse",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :pre_signed_urls, 1, type: Flyteidl2.Dataproxy.PreSignedURLs, json_name: "preSignedUrls"
end

defmodule Flyteidl2.Dataproxy.GetActionDataRequest do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.dataproxy.GetActionDataRequest",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :action_id, 1,
    type: Flyteidl2.Common.ActionIdentifier,
    json_name: "actionId",
    deprecated: false
end

defmodule Flyteidl2.Dataproxy.GetActionDataResponse do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.dataproxy.GetActionDataResponse",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :inputs, 1, type: Flyteidl2.Task.Inputs
  field :outputs, 2, type: Flyteidl2.Task.Outputs
end

defmodule Flyteidl2.Dataproxy.TailLogsRequest do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.dataproxy.TailLogsRequest",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :action_id, 1,
    type: Flyteidl2.Common.ActionIdentifier,
    json_name: "actionId",
    deprecated: false

  field :attempt, 2, type: :uint32, deprecated: false
  field :pod_name, 3, type: :string, json_name: "podName"
end

defmodule Flyteidl2.Dataproxy.TailLogsResponse.Logs do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.dataproxy.TailLogsResponse.Logs",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :lines, 1, repeated: true, type: Flyteidl2.Logs.Dataplane.LogLine
end

defmodule Flyteidl2.Dataproxy.TailLogsResponse do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.dataproxy.TailLogsResponse",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :logs, 1, repeated: true, type: Flyteidl2.Dataproxy.TailLogsResponse.Logs
end

defmodule Flyteidl2.Dataproxy.DataProxyService.Service do
  @moduledoc false

  use GRPC.Service,
    name: "flyteidl2.dataproxy.DataProxyService",
    protoc_gen_elixir_version: "0.16.0"

  rpc :CreateUploadLocation,
      Flyteidl2.Dataproxy.CreateUploadLocationRequest,
      Flyteidl2.Dataproxy.CreateUploadLocationResponse

  rpc :UploadInputs,
      Flyteidl2.Dataproxy.UploadInputsRequest,
      Flyteidl2.Dataproxy.UploadInputsResponse

  rpc :CreateDownloadLink,
      Flyteidl2.Dataproxy.CreateDownloadLinkRequest,
      Flyteidl2.Dataproxy.CreateDownloadLinkResponse

  rpc :GetActionData,
      Flyteidl2.Dataproxy.GetActionDataRequest,
      Flyteidl2.Dataproxy.GetActionDataResponse

  rpc :TailLogs, Flyteidl2.Dataproxy.TailLogsRequest, stream(Flyteidl2.Dataproxy.TailLogsResponse)
end

defmodule Flyteidl2.Dataproxy.DataProxyService.Stub do
  @moduledoc false

  use GRPC.Stub, service: Flyteidl2.Dataproxy.DataProxyService.Service
end
