defmodule Flyteidl2.Settings.SettingState do
  @moduledoc false

  use Protobuf,
    enum: true,
    full_name: "flyteidl2.settings.SettingState",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :SETTING_STATE_INHERIT, 0
  field :SETTING_STATE_UNSET, 1
  field :SETTING_STATE_VALUE, 2
end

defmodule Flyteidl2.Settings.ScopeLevel do
  @moduledoc false

  use Protobuf,
    enum: true,
    full_name: "flyteidl2.settings.ScopeLevel",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :SCOPE_LEVEL_ORG, 0
  field :SCOPE_LEVEL_DOMAIN, 1
  field :SCOPE_LEVEL_PROJECT, 2
end

defmodule Flyteidl2.Settings.StringValues do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.settings.StringValues",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :values, 1, repeated: true, type: :string
end

defmodule Flyteidl2.Settings.StringMap.EntriesEntry do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.settings.StringMap.EntriesEntry",
    map: true,
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :key, 1, type: :string
  field :value, 2, type: :string
end

defmodule Flyteidl2.Settings.StringMap do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.settings.StringMap",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :entries, 1, repeated: true, type: Flyteidl2.Settings.StringMap.EntriesEntry, map: true
end

defmodule Flyteidl2.Settings.SettingsKey do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.settings.SettingsKey",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :org, 1, type: :string, deprecated: false
  field :domain, 2, type: :string
  field :project, 3, type: :string
end

defmodule Flyteidl2.Settings.StringSetting do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.settings.StringSetting",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :state, 1, type: Flyteidl2.Settings.SettingState, enum: true
  field :string_value, 2, type: :string, json_name: "stringValue"
  field :scope_level, 3, type: Flyteidl2.Settings.ScopeLevel, json_name: "scopeLevel", enum: true
end

defmodule Flyteidl2.Settings.Int64Setting do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.settings.Int64Setting",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :state, 1, type: Flyteidl2.Settings.SettingState, enum: true
  field :int_value, 2, type: :int64, json_name: "intValue"
  field :scope_level, 3, type: Flyteidl2.Settings.ScopeLevel, json_name: "scopeLevel", enum: true
end

defmodule Flyteidl2.Settings.BoolSetting do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.settings.BoolSetting",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :state, 1, type: Flyteidl2.Settings.SettingState, enum: true
  field :bool_value, 2, type: :bool, json_name: "boolValue"
  field :scope_level, 3, type: Flyteidl2.Settings.ScopeLevel, json_name: "scopeLevel", enum: true
end

defmodule Flyteidl2.Settings.StringListSetting do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.settings.StringListSetting",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :state, 1, type: Flyteidl2.Settings.SettingState, enum: true
  field :list_value, 2, type: Flyteidl2.Settings.StringValues, json_name: "listValue"
  field :scope_level, 3, type: Flyteidl2.Settings.ScopeLevel, json_name: "scopeLevel", enum: true
end

defmodule Flyteidl2.Settings.StringMapSetting do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.settings.StringMapSetting",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :state, 1, type: Flyteidl2.Settings.SettingState, enum: true
  field :map_value, 2, type: Flyteidl2.Settings.StringMap, json_name: "mapValue"
  field :scope_level, 3, type: Flyteidl2.Settings.ScopeLevel, json_name: "scopeLevel", enum: true
end

defmodule Flyteidl2.Settings.QuantitySetting do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.settings.QuantitySetting",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :state, 1, type: Flyteidl2.Settings.SettingState, enum: true
  field :quantity_value, 2, type: :string, json_name: "quantityValue"
  field :scope_level, 3, type: Flyteidl2.Settings.ScopeLevel, json_name: "scopeLevel", enum: true
end

defmodule Flyteidl2.Settings.RunSettings do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.settings.RunSettings",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :default_queue, 1,
    type: Flyteidl2.Settings.StringSetting,
    json_name: "defaultQueue",
    deprecated: false

  field :run_concurrency, 2,
    type: Flyteidl2.Settings.Int64Setting,
    json_name: "runConcurrency",
    deprecated: false

  field :action_concurrency, 3,
    type: Flyteidl2.Settings.Int64Setting,
    json_name: "actionConcurrency",
    deprecated: false
end

defmodule Flyteidl2.Settings.SecuritySettings do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.settings.SecuritySettings",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :service_account, 1,
    type: Flyteidl2.Settings.StringSetting,
    json_name: "serviceAccount",
    deprecated: false
end

defmodule Flyteidl2.Settings.StorageSettings do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.settings.StorageSettings",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :raw_data_path, 1,
    type: Flyteidl2.Settings.StringSetting,
    json_name: "rawDataPath",
    deprecated: false
end

defmodule Flyteidl2.Settings.TaskResourceDefaults do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.settings.TaskResourceDefaults",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :cpu, 1, type: Flyteidl2.Settings.QuantitySetting, deprecated: false
  field :gpu, 2, type: Flyteidl2.Settings.QuantitySetting, deprecated: false
  field :memory, 3, type: Flyteidl2.Settings.QuantitySetting, deprecated: false
  field :storage, 4, type: Flyteidl2.Settings.QuantitySetting, deprecated: false
end

defmodule Flyteidl2.Settings.TaskResourceSettings do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.settings.TaskResourceSettings",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :min, 1, type: Flyteidl2.Settings.TaskResourceDefaults, deprecated: false
  field :max, 2, type: Flyteidl2.Settings.TaskResourceDefaults, deprecated: false

  field :mirror_limits_request, 3,
    type: Flyteidl2.Settings.BoolSetting,
    json_name: "mirrorLimitsRequest",
    deprecated: false
end

defmodule Flyteidl2.Settings.Settings do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.settings.Settings",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :run, 1, type: Flyteidl2.Settings.RunSettings
  field :security, 2, type: Flyteidl2.Settings.SecuritySettings
  field :storage, 3, type: Flyteidl2.Settings.StorageSettings

  field :task_resource, 4,
    type: Flyteidl2.Settings.TaskResourceSettings,
    json_name: "taskResource"

  field :labels, 5, type: Flyteidl2.Settings.StringListSetting, deprecated: false
  field :annotations, 6, type: Flyteidl2.Settings.StringMapSetting, deprecated: false

  field :environment_variables, 7,
    type: Flyteidl2.Settings.StringMapSetting,
    json_name: "environmentVariables",
    deprecated: false
end
