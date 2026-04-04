defmodule Flyteidl2.Org.SettingState do
  @moduledoc false

  use Protobuf,
    enum: true,
    full_name: "flyteidl2.org.SettingState",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :SETTING_STATE_INHERIT, 0
  field :SETTING_STATE_UNSET, 1
  field :SETTING_STATE_VALUE, 2
end

defmodule Flyteidl2.Org.ScopeLevel do
  @moduledoc false

  use Protobuf,
    enum: true,
    full_name: "flyteidl2.org.ScopeLevel",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :SCOPE_LEVEL_ORG, 0
  field :SCOPE_LEVEL_DOMAIN, 1
  field :SCOPE_LEVEL_PROJECT, 2
end

defmodule Flyteidl2.Org.StringValues do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.org.StringValues",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :values, 1, repeated: true, type: :string
end

defmodule Flyteidl2.Org.StringMap.EntriesEntry do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.org.StringMap.EntriesEntry",
    map: true,
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :key, 1, type: :string
  field :value, 2, type: :string
end

defmodule Flyteidl2.Org.StringMap do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.org.StringMap",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :entries, 1, repeated: true, type: Flyteidl2.Org.StringMap.EntriesEntry, map: true
end

defmodule Flyteidl2.Org.SettingsKey do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.org.SettingsKey",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :org, 1, type: :string, deprecated: false
  field :domain, 2, type: :string
  field :project, 3, type: :string
end

defmodule Flyteidl2.Org.StringSetting do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.org.StringSetting",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :state, 1, type: Flyteidl2.Org.SettingState, enum: true
  field :string_value, 2, type: :string, json_name: "stringValue"
  field :scope_level, 3, type: Flyteidl2.Org.ScopeLevel, json_name: "scopeLevel", enum: true
end

defmodule Flyteidl2.Org.Int64Setting do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.org.Int64Setting",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :state, 1, type: Flyteidl2.Org.SettingState, enum: true
  field :int_value, 2, type: :int64, json_name: "intValue"
  field :scope_level, 3, type: Flyteidl2.Org.ScopeLevel, json_name: "scopeLevel", enum: true
end

defmodule Flyteidl2.Org.BoolSetting do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.org.BoolSetting",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :state, 1, type: Flyteidl2.Org.SettingState, enum: true
  field :bool_value, 2, type: :bool, json_name: "boolValue"
  field :scope_level, 3, type: Flyteidl2.Org.ScopeLevel, json_name: "scopeLevel", enum: true
end

defmodule Flyteidl2.Org.StringListSetting do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.org.StringListSetting",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :state, 1, type: Flyteidl2.Org.SettingState, enum: true
  field :list_value, 2, type: Flyteidl2.Org.StringValues, json_name: "listValue"
  field :scope_level, 3, type: Flyteidl2.Org.ScopeLevel, json_name: "scopeLevel", enum: true
end

defmodule Flyteidl2.Org.StringMapSetting do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.org.StringMapSetting",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :state, 1, type: Flyteidl2.Org.SettingState, enum: true
  field :map_value, 2, type: Flyteidl2.Org.StringMap, json_name: "mapValue"
  field :scope_level, 3, type: Flyteidl2.Org.ScopeLevel, json_name: "scopeLevel", enum: true
end

defmodule Flyteidl2.Org.QuantitySetting do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.org.QuantitySetting",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :state, 1, type: Flyteidl2.Org.SettingState, enum: true
  field :quantity_value, 2, type: :string, json_name: "quantityValue"
  field :scope_level, 3, type: Flyteidl2.Org.ScopeLevel, json_name: "scopeLevel", enum: true
end

defmodule Flyteidl2.Org.RunSettings do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.org.RunSettings",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :default_queue, 1,
    type: Flyteidl2.Org.StringSetting,
    json_name: "defaultQueue",
    deprecated: false

  field :run_concurrency, 2,
    type: Flyteidl2.Org.Int64Setting,
    json_name: "runConcurrency",
    deprecated: false

  field :action_concurrency, 3,
    type: Flyteidl2.Org.Int64Setting,
    json_name: "actionConcurrency",
    deprecated: false
end

defmodule Flyteidl2.Org.SecuritySettings do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.org.SecuritySettings",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :service_account, 1,
    type: Flyteidl2.Org.StringSetting,
    json_name: "serviceAccount",
    deprecated: false
end

defmodule Flyteidl2.Org.StorageSettings do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.org.StorageSettings",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :raw_data_path, 1,
    type: Flyteidl2.Org.StringSetting,
    json_name: "rawDataPath",
    deprecated: false
end

defmodule Flyteidl2.Org.TaskResourceDefaults do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.org.TaskResourceDefaults",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :cpu, 1, type: Flyteidl2.Org.QuantitySetting, deprecated: false
  field :gpu, 2, type: Flyteidl2.Org.QuantitySetting, deprecated: false
  field :memory, 3, type: Flyteidl2.Org.QuantitySetting, deprecated: false
  field :storage, 4, type: Flyteidl2.Org.QuantitySetting, deprecated: false
end

defmodule Flyteidl2.Org.TaskResourceSettings do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.org.TaskResourceSettings",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :min, 1, type: Flyteidl2.Org.TaskResourceDefaults, deprecated: false
  field :max, 2, type: Flyteidl2.Org.TaskResourceDefaults, deprecated: false

  field :mirror_limits_request, 3,
    type: Flyteidl2.Org.BoolSetting,
    json_name: "mirrorLimitsRequest",
    deprecated: false
end

defmodule Flyteidl2.Org.Settings do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.org.Settings",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :run, 1, type: Flyteidl2.Org.RunSettings
  field :security, 2, type: Flyteidl2.Org.SecuritySettings
  field :storage, 3, type: Flyteidl2.Org.StorageSettings
  field :task_resource, 4, type: Flyteidl2.Org.TaskResourceSettings, json_name: "taskResource"
  field :labels, 5, type: Flyteidl2.Org.StringListSetting, deprecated: false
  field :annotations, 6, type: Flyteidl2.Org.StringMapSetting, deprecated: false

  field :environment_variables, 7,
    type: Flyteidl2.Org.StringMapSetting,
    json_name: "environmentVariables",
    deprecated: false
end
