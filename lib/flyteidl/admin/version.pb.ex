defmodule Flyteidl.Admin.GetVersionResponse do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :control_plane_version, 1, type: Flyteidl.Admin.Version, json_name: "controlPlaneVersion"
end

defmodule Flyteidl.Admin.Version do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :Build, 1, type: :string
  field :Version, 2, type: :string
  field :BuildTime, 3, type: :string
end

defmodule Flyteidl.Admin.GetVersionRequest do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"
end