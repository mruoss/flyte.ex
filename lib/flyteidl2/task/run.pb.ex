defmodule Flyteidl2.Task.CacheLookupScope do
  @moduledoc false

  use Protobuf, enum: true, protoc_gen_elixir_version: "0.15.0", syntax: :proto3

  field :CACHE_LOOKUP_SCOPE_UNSPECIFIED, 0
  field :CACHE_LOOKUP_SCOPE_GLOBAL, 1
  field :CACHE_LOOKUP_SCOPE_PROJECT_DOMAIN, 2
end

defmodule Flyteidl2.Task.Labels.ValuesEntry do
  @moduledoc false

  use Protobuf, map: true, protoc_gen_elixir_version: "0.15.0", syntax: :proto3

  field :key, 1, type: :string
  field :value, 2, type: :string
end

defmodule Flyteidl2.Task.Labels do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.15.0", syntax: :proto3

  field :values, 1, repeated: true, type: Flyteidl2.Task.Labels.ValuesEntry, map: true
end

defmodule Flyteidl2.Task.Annotations.ValuesEntry do
  @moduledoc false

  use Protobuf, map: true, protoc_gen_elixir_version: "0.15.0", syntax: :proto3

  field :key, 1, type: :string
  field :value, 2, type: :string
end

defmodule Flyteidl2.Task.Annotations do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.15.0", syntax: :proto3

  field :values, 1, repeated: true, type: Flyteidl2.Task.Annotations.ValuesEntry, map: true
end

defmodule Flyteidl2.Task.Envs do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.15.0", syntax: :proto3

  field :values, 1, repeated: true, type: Flyteidl2.Core.KeyValuePair
end

defmodule Flyteidl2.Task.RawDataStorage do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.15.0", syntax: :proto3

  field :raw_data_prefix, 1, type: :string, json_name: "rawDataPrefix"
end

defmodule Flyteidl2.Task.CacheConfig do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.15.0", syntax: :proto3

  field :overwrite_cache, 1, type: :bool, json_name: "overwriteCache"

  field :cache_lookup_scope, 2,
    type: Flyteidl2.Task.CacheLookupScope,
    json_name: "cacheLookupScope",
    enum: true
end

defmodule Flyteidl2.Task.RunSpec do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.15.0", syntax: :proto3

  field :labels, 1, type: Flyteidl2.Task.Labels
  field :annotations, 2, type: Flyteidl2.Task.Annotations
  field :envs, 3, type: Flyteidl2.Task.Envs
  field :interruptible, 4, type: Google.Protobuf.BoolValue
  field :overwrite_cache, 5, type: :bool, json_name: "overwriteCache", deprecated: true
  field :cluster, 6, type: :string
  field :raw_data_storage, 7, type: Flyteidl2.Task.RawDataStorage, json_name: "rawDataStorage"
  field :security_context, 8, type: Flyteidl2.Core.SecurityContext, json_name: "securityContext"
  field :cache_config, 9, type: Flyteidl2.Task.CacheConfig, json_name: "cacheConfig"
end
