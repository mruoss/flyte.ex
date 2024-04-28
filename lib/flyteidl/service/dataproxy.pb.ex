defmodule Flyteidl.Service.ArtifactType do
  @moduledoc false

  use Protobuf, enum: true, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :ARTIFACT_TYPE_UNDEFINED, 0
  field :ARTIFACT_TYPE_DECK, 1
end

defmodule Flyteidl.Service.CreateUploadLocationResponse do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :signed_url, 1, type: :string, json_name: "signedUrl"
  field :native_url, 2, type: :string, json_name: "nativeUrl"
  field :expires_at, 3, type: Google.Protobuf.Timestamp, json_name: "expiresAt"
end

defmodule Flyteidl.Service.CreateUploadLocationRequest do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :project, 1, type: :string
  field :domain, 2, type: :string
  field :filename, 3, type: :string
  field :expires_in, 4, type: Google.Protobuf.Duration, json_name: "expiresIn"
  field :content_md5, 5, type: :bytes, json_name: "contentMd5"
  field :filename_root, 6, type: :string, json_name: "filenameRoot"
end

defmodule Flyteidl.Service.CreateDownloadLocationRequest do
  @moduledoc false

  use Protobuf, deprecated: true, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :native_url, 1, type: :string, json_name: "nativeUrl"
  field :expires_in, 2, type: Google.Protobuf.Duration, json_name: "expiresIn"
end

defmodule Flyteidl.Service.CreateDownloadLocationResponse do
  @moduledoc false

  use Protobuf, deprecated: true, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :signed_url, 1, type: :string, json_name: "signedUrl"
  field :expires_at, 2, type: Google.Protobuf.Timestamp, json_name: "expiresAt"
end

defmodule Flyteidl.Service.CreateDownloadLinkRequest do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  oneof :source, 0

  field :artifact_type, 1,
    type: Flyteidl.Service.ArtifactType,
    json_name: "artifactType",
    enum: true

  field :expires_in, 2, type: Google.Protobuf.Duration, json_name: "expiresIn"

  field :node_execution_id, 3,
    type: Flyteidl.Core.NodeExecutionIdentifier,
    json_name: "nodeExecutionId",
    oneof: 0
end

defmodule Flyteidl.Service.CreateDownloadLinkResponse do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :signed_url, 1, repeated: true, type: :string, json_name: "signedUrl", deprecated: true
  field :expires_at, 2, type: Google.Protobuf.Timestamp, json_name: "expiresAt", deprecated: true
  field :pre_signed_urls, 3, type: Flyteidl.Service.PreSignedURLs, json_name: "preSignedUrls"
end

defmodule Flyteidl.Service.PreSignedURLs do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :signed_url, 1, repeated: true, type: :string, json_name: "signedUrl"
  field :expires_at, 2, type: Google.Protobuf.Timestamp, json_name: "expiresAt"
end

defmodule Flyteidl.Service.GetDataRequest do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :flyte_url, 1, type: :string, json_name: "flyteUrl"
end

defmodule Flyteidl.Service.GetDataResponse do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  oneof :data, 0

  field :literal_map, 1, type: Flyteidl.Core.LiteralMap, json_name: "literalMap", oneof: 0

  field :pre_signed_urls, 2,
    type: Flyteidl.Service.PreSignedURLs,
    json_name: "preSignedUrls",
    oneof: 0

  field :literal, 3, type: Flyteidl.Core.Literal, oneof: 0
end

defmodule Flyteidl.Service.DataProxyService.Service do
  @moduledoc false

  use GRPC.Service, name: "flyteidl.service.DataProxyService", protoc_gen_elixir_version: "0.12.0"

  rpc :CreateUploadLocation,
      Flyteidl.Service.CreateUploadLocationRequest,
      Flyteidl.Service.CreateUploadLocationResponse

  rpc :CreateDownloadLocation,
      Flyteidl.Service.CreateDownloadLocationRequest,
      Flyteidl.Service.CreateDownloadLocationResponse

  rpc :CreateDownloadLink,
      Flyteidl.Service.CreateDownloadLinkRequest,
      Flyteidl.Service.CreateDownloadLinkResponse

  rpc :GetData, Flyteidl.Service.GetDataRequest, Flyteidl.Service.GetDataResponse
end

defmodule Flyteidl.Service.DataProxyService.Stub do
  @moduledoc false

  use GRPC.Stub, service: Flyteidl.Service.DataProxyService.Service
end