defmodule Flyteidl2.Org.SettingsRecord do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.org.SettingsRecord",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :key, 1, type: Flyteidl2.Org.SettingsKey
  field :settings, 2, type: Flyteidl2.Org.Settings
  field :version, 3, type: :uint64
end

defmodule Flyteidl2.Org.GetSettingsRequest do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.org.GetSettingsRequest",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :key, 1, type: Flyteidl2.Org.SettingsKey, deprecated: false
end

defmodule Flyteidl2.Org.GetSettingsResponse do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.org.GetSettingsResponse",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :settingsRecord, 1, type: Flyteidl2.Org.SettingsRecord
end

defmodule Flyteidl2.Org.GetSettingsForEditRequest do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.org.GetSettingsForEditRequest",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :key, 1, type: Flyteidl2.Org.SettingsKey, deprecated: false
end

defmodule Flyteidl2.Org.GetSettingsForEditResponse do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.org.GetSettingsForEditResponse",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :requestedKey, 1, type: Flyteidl2.Org.SettingsKey
  field :levels, 2, repeated: true, type: Flyteidl2.Org.SettingsRecord
end

defmodule Flyteidl2.Org.CreateSettingsRequest do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.org.CreateSettingsRequest",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :key, 1, type: Flyteidl2.Org.SettingsKey, deprecated: false
  field :settings, 2, type: Flyteidl2.Org.Settings, deprecated: false
end

defmodule Flyteidl2.Org.CreateSettingsResponse do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.org.CreateSettingsResponse",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :settingsRecord, 1, type: Flyteidl2.Org.SettingsRecord
end

defmodule Flyteidl2.Org.UpdateSettingsRequest do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.org.UpdateSettingsRequest",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :key, 1, type: Flyteidl2.Org.SettingsKey, deprecated: false
  field :settings, 2, type: Flyteidl2.Org.Settings, deprecated: false
  field :version, 3, type: :uint64
end

defmodule Flyteidl2.Org.UpdateSettingsResponse do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.org.UpdateSettingsResponse",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :settingsRecord, 1, type: Flyteidl2.Org.SettingsRecord
end

defmodule Flyteidl2.Org.SettingsService.Service do
  @moduledoc false

  use GRPC.Service, name: "flyteidl2.org.SettingsService", protoc_gen_elixir_version: "0.16.0"

  rpc :GetSettings, Flyteidl2.Org.GetSettingsRequest, Flyteidl2.Org.GetSettingsResponse

  rpc :GetSettingsForEdit,
      Flyteidl2.Org.GetSettingsForEditRequest,
      Flyteidl2.Org.GetSettingsForEditResponse

  rpc :CreateSettings, Flyteidl2.Org.CreateSettingsRequest, Flyteidl2.Org.CreateSettingsResponse

  rpc :UpdateSettings, Flyteidl2.Org.UpdateSettingsRequest, Flyteidl2.Org.UpdateSettingsResponse
end

defmodule Flyteidl2.Org.SettingsService.Stub do
  @moduledoc false

  use GRPC.Stub, service: Flyteidl2.Org.SettingsService.Service
end
