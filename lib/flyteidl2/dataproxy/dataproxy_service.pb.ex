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

defmodule Flyteidl2.Dataproxy.DataProxyService.Service do
  @moduledoc false

  use GRPC.Service,
    name: "flyteidl2.dataproxy.DataProxyService",
    protoc_gen_elixir_version: "0.16.0"

  rpc :CreateUploadLocation,
      Flyteidl2.Dataproxy.CreateUploadLocationRequest,
      Flyteidl2.Dataproxy.CreateUploadLocationResponse
end

defmodule Flyteidl2.Dataproxy.DataProxyService.Stub do
  @moduledoc false

  use GRPC.Stub, service: Flyteidl2.Dataproxy.DataProxyService.Service
end
