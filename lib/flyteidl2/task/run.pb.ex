defmodule Flyteidl2.Task.CacheLookupScope do
  @moduledoc false

  use Protobuf,
    enum: true,
    full_name: "flyteidl2.task.CacheLookupScope",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :CACHE_LOOKUP_SCOPE_UNSPECIFIED, 0
  field :CACHE_LOOKUP_SCOPE_GLOBAL, 1
  field :CACHE_LOOKUP_SCOPE_PROJECT_DOMAIN, 2
end

defmodule Flyteidl2.Task.Labels.ValuesEntry do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.task.Labels.ValuesEntry",
    map: true,
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :key, 1, type: :string
  field :value, 2, type: :string
end

defmodule Flyteidl2.Task.Labels do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.task.Labels",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :values, 1, repeated: true, type: Flyteidl2.Task.Labels.ValuesEntry, map: true
end

defmodule Flyteidl2.Task.Annotations.ValuesEntry do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.task.Annotations.ValuesEntry",
    map: true,
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :key, 1, type: :string
  field :value, 2, type: :string
end

defmodule Flyteidl2.Task.Annotations do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.task.Annotations",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :values, 1, repeated: true, type: Flyteidl2.Task.Annotations.ValuesEntry, map: true
end

defmodule Flyteidl2.Task.Envs do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.task.Envs",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :values, 1, repeated: true, type: Flyteidl2.Core.KeyValuePair
end

defmodule Flyteidl2.Task.RawDataStorage do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.task.RawDataStorage",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :raw_data_prefix, 1, type: :string, json_name: "rawDataPrefix"
end

defmodule Flyteidl2.Task.CacheConfig do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.task.CacheConfig",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :overwrite_cache, 1, type: :bool, json_name: "overwriteCache"

  field :cache_lookup_scope, 2,
    type: Flyteidl2.Task.CacheLookupScope,
    json_name: "cacheLookupScope",
    enum: true
end

defmodule Flyteidl2.Task.RunSpec do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.task.RunSpec",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  oneof :notification_settings, 0

  field :labels, 1, type: Flyteidl2.Task.Labels
  field :annotations, 2, type: Flyteidl2.Task.Annotations
  field :envs, 3, type: Flyteidl2.Task.Envs
  field :interruptible, 4, type: Google.Protobuf.BoolValue
  field :overwrite_cache, 5, type: :bool, json_name: "overwriteCache", deprecated: true
  field :cluster, 6, type: :string
  field :raw_data_storage, 7, type: Flyteidl2.Task.RawDataStorage, json_name: "rawDataStorage"
  field :security_context, 8, type: Flyteidl2.Core.SecurityContext, json_name: "securityContext"
  field :cache_config, 9, type: Flyteidl2.Task.CacheConfig, json_name: "cacheConfig"
  field :notification_rule_name, 10, type: :string, json_name: "notificationRuleName", oneof: 0

  field :notification_rules, 11,
    type: Flyteidl2.Task.InlineRuleList,
    json_name: "notificationRules",
    oneof: 0
end

defmodule Flyteidl2.Task.InlineRuleList do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.task.InlineRuleList",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :rules, 1, repeated: true, type: Flyteidl2.Task.InlineRule, deprecated: false
end

defmodule Flyteidl2.Task.InlineRule do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.task.InlineRule",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  oneof :delivery, 0

  field :on_phases, 1,
    repeated: true,
    type: Flyteidl2.Common.ActionPhase,
    json_name: "onPhases",
    enum: true,
    deprecated: false

  field :delivery_config_name, 2, type: :string, json_name: "deliveryConfigName", oneof: 0

  field :delivery_template, 3,
    type: Flyteidl2.Notification.DeliveryConfigTemplate,
    json_name: "deliveryTemplate",
    oneof: 0
end
