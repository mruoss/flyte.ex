defmodule Flyteidl2.Settings.SettingsRecord do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.settings.SettingsRecord",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :key, 1, type: Flyteidl2.Settings.SettingsKey
  field :settings, 2, type: Flyteidl2.Settings.Settings
  field :version, 3, type: :uint64
end

defmodule Flyteidl2.Settings.GetSettingsRequest do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.settings.GetSettingsRequest",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :key, 1, type: Flyteidl2.Settings.SettingsKey, deprecated: false
end

defmodule Flyteidl2.Settings.GetSettingsResponse do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.settings.GetSettingsResponse",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :settingsRecord, 1, type: Flyteidl2.Settings.SettingsRecord
end

defmodule Flyteidl2.Settings.GetSettingsForEditRequest do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.settings.GetSettingsForEditRequest",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :key, 1, type: Flyteidl2.Settings.SettingsKey, deprecated: false
end

defmodule Flyteidl2.Settings.GetSettingsForEditResponse do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.settings.GetSettingsForEditResponse",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :requestedKey, 1, type: Flyteidl2.Settings.SettingsKey
  field :levels, 2, repeated: true, type: Flyteidl2.Settings.SettingsRecord
end

defmodule Flyteidl2.Settings.CreateSettingsRequest do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.settings.CreateSettingsRequest",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :key, 1, type: Flyteidl2.Settings.SettingsKey, deprecated: false
  field :settings, 2, type: Flyteidl2.Settings.Settings, deprecated: false
end

defmodule Flyteidl2.Settings.CreateSettingsResponse do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.settings.CreateSettingsResponse",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :settingsRecord, 1, type: Flyteidl2.Settings.SettingsRecord
end

defmodule Flyteidl2.Settings.UpdateSettingsRequest do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.settings.UpdateSettingsRequest",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :key, 1, type: Flyteidl2.Settings.SettingsKey, deprecated: false
  field :settings, 2, type: Flyteidl2.Settings.Settings, deprecated: false
  field :version, 3, type: :uint64
end

defmodule Flyteidl2.Settings.UpdateSettingsResponse do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.settings.UpdateSettingsResponse",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :settingsRecord, 1, type: Flyteidl2.Settings.SettingsRecord
end

defmodule Flyteidl2.Settings.SettingsService.Service do
  @moduledoc false

  use GRPC.Service,
    name: "flyteidl2.settings.SettingsService",
    protoc_gen_elixir_version: "0.16.0"

  rpc :GetSettings, Flyteidl2.Settings.GetSettingsRequest, Flyteidl2.Settings.GetSettingsResponse

  rpc :GetSettingsForEdit,
      Flyteidl2.Settings.GetSettingsForEditRequest,
      Flyteidl2.Settings.GetSettingsForEditResponse

  rpc :CreateSettings,
      Flyteidl2.Settings.CreateSettingsRequest,
      Flyteidl2.Settings.CreateSettingsResponse

  rpc :UpdateSettings,
      Flyteidl2.Settings.UpdateSettingsRequest,
      Flyteidl2.Settings.UpdateSettingsResponse
end

defmodule Flyteidl2.Settings.SettingsService.Stub do
  @moduledoc false

  use GRPC.Stub, service: Flyteidl2.Settings.SettingsService.Service
end
