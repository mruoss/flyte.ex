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

defmodule Flyteidl2.Org.RawSettingsRecord.DataEntry do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.org.RawSettingsRecord.DataEntry",
    map: true,
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :key, 1, type: :string
  field :value, 2, type: Flyteidl2.Org.SettingValue
end

defmodule Flyteidl2.Org.RawSettingsRecord do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.org.RawSettingsRecord",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :key, 1, type: Flyteidl2.Org.SettingsKey
  field :data, 2, repeated: true, type: Flyteidl2.Org.RawSettingsRecord.DataEntry, map: true
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

defmodule Flyteidl2.Org.GetSettingsForEditRawRequest do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.org.GetSettingsForEditRawRequest",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :key, 1, type: Flyteidl2.Org.SettingsKey, deprecated: false
end

defmodule Flyteidl2.Org.GetSettingsForEditRawResponse do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.org.GetSettingsForEditRawResponse",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :requestedKey, 1, type: Flyteidl2.Org.SettingsKey
  field :levels, 2, repeated: true, type: Flyteidl2.Org.RawSettingsRecord
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

defmodule Flyteidl2.Org.UpdateSettingsRawRequest.DataEntry do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.org.UpdateSettingsRawRequest.DataEntry",
    map: true,
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :key, 1, type: :string
  field :value, 2, type: Flyteidl2.Org.SettingValue
end

defmodule Flyteidl2.Org.UpdateSettingsRawRequest do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.org.UpdateSettingsRawRequest",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :key, 1, type: Flyteidl2.Org.SettingsKey, deprecated: false

  field :data, 2,
    repeated: true,
    type: Flyteidl2.Org.UpdateSettingsRawRequest.DataEntry,
    map: true

  field :version, 3, type: :uint64
end

defmodule Flyteidl2.Org.UpdateSettingsRawResponse do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.org.UpdateSettingsRawResponse",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3
end

defmodule Flyteidl2.Org.SettingsService.Service do
  @moduledoc false

  use GRPC.Service, name: "flyteidl2.org.SettingsService", protoc_gen_elixir_version: "0.16.0"

  rpc :GetSettings, Flyteidl2.Org.GetSettingsRequest, Flyteidl2.Org.GetSettingsResponse

  rpc :GetSettingsForEdit,
      Flyteidl2.Org.GetSettingsForEditRequest,
      Flyteidl2.Org.GetSettingsForEditResponse

  rpc :GetSettingsForEditRaw,
      Flyteidl2.Org.GetSettingsForEditRawRequest,
      Flyteidl2.Org.GetSettingsForEditRawResponse

  rpc :CreateSettings, Flyteidl2.Org.CreateSettingsRequest, Flyteidl2.Org.CreateSettingsResponse

  rpc :UpdateSettings, Flyteidl2.Org.UpdateSettingsRequest, Flyteidl2.Org.UpdateSettingsResponse

  rpc :UpdateSettingsRaw,
      Flyteidl2.Org.UpdateSettingsRawRequest,
      Flyteidl2.Org.UpdateSettingsRawResponse
end

defmodule Flyteidl2.Org.SettingsService.Stub do
  @moduledoc false

  use GRPC.Stub, service: Flyteidl2.Org.SettingsService.Service
end
