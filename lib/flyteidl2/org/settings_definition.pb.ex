defmodule Flyteidl2.Org.SettingState do
  @moduledoc false

  use Protobuf,
    enum: true,
    full_name: "flyteidl2.org.SettingState",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :SETTING_STATE_INHERIT, 0
  field :SETTING_STATE_UNSET, 1
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

defmodule Flyteidl2.Org.SettingValue do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.org.SettingValue",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  oneof :value, 0

  field :state, 1, type: Flyteidl2.Org.SettingState, enum: true, oneof: 0
  field :string_value, 2, type: :string, json_name: "stringValue", oneof: 0
  field :int_value, 3, type: :int64, json_name: "intValue", oneof: 0
  field :bool_value, 4, type: :bool, json_name: "boolValue", oneof: 0
  field :list_value, 5, type: Flyteidl2.Org.StringValues, json_name: "listValue", oneof: 0
  field :map_value, 6, type: Flyteidl2.Org.StringMap, json_name: "mapValue", oneof: 0
  field :description, 7, type: :string
  field :scope_level, 8, type: Flyteidl2.Org.ScopeLevel, json_name: "scopeLevel", enum: true
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

defmodule Flyteidl2.Org.RunSettings do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.org.RunSettings",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :default_queue, 1, type: Flyteidl2.Org.SettingValue, json_name: "defaultQueue"
  field :run_concurrency, 2, type: Flyteidl2.Org.SettingValue, json_name: "runConcurrency"
  field :action_concurrency, 3, type: Flyteidl2.Org.SettingValue, json_name: "actionConcurrency"
end

defmodule Flyteidl2.Org.SecuritySettings do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.org.SecuritySettings",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :service_account, 1, type: Flyteidl2.Org.SettingValue, json_name: "serviceAccount"
end

defmodule Flyteidl2.Org.StorageSettings do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.org.StorageSettings",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :raw_data_path, 1, type: Flyteidl2.Org.SettingValue, json_name: "rawDataPath"
end

defmodule Flyteidl2.Org.TaskResourceDefaults do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.org.TaskResourceDefaults",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :min_cpu, 1, type: Flyteidl2.Org.SettingValue, json_name: "minCpu"
  field :min_gpu, 2, type: Flyteidl2.Org.SettingValue, json_name: "minGpu"
  field :min_memory, 3, type: Flyteidl2.Org.SettingValue, json_name: "minMemory"
  field :min_storage, 4, type: Flyteidl2.Org.SettingValue, json_name: "minStorage"
  field :max_cpu, 5, type: Flyteidl2.Org.SettingValue, json_name: "maxCpu"
  field :max_gpu, 6, type: Flyteidl2.Org.SettingValue, json_name: "maxGpu"
  field :max_memory, 7, type: Flyteidl2.Org.SettingValue, json_name: "maxMemory"
  field :max_storage, 8, type: Flyteidl2.Org.SettingValue, json_name: "maxStorage"
end

defmodule Flyteidl2.Org.TaskResourceSettings do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.org.TaskResourceSettings",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :defaults, 1, type: Flyteidl2.Org.TaskResourceDefaults

  field :mirror_limits_request, 2,
    type: Flyteidl2.Org.SettingValue,
    json_name: "mirrorLimitsRequest"
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
  field :labels, 5, type: Flyteidl2.Org.SettingValue
  field :annotations, 6, type: Flyteidl2.Org.SettingValue

  field :environment_variables, 7,
    type: Flyteidl2.Org.SettingValue,
    json_name: "environmentVariables"
end
