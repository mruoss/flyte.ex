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
end

defmodule Flyteidl2.Dataproxy.DataProxyService.Stub do
  @moduledoc false

  use GRPC.Stub, service: Flyteidl2.Dataproxy.DataProxyService.Service
end
