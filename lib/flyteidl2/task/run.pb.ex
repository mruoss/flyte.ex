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

defmodule Flyteidl2.Task.RunSpec do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.15.0", syntax: :proto3

  field :labels, 1, type: Flyteidl2.Task.Labels
  field :annotations, 2, type: Flyteidl2.Task.Annotations
  field :envs, 3, type: Flyteidl2.Task.Envs
  field :interruptible, 4, type: Google.Protobuf.BoolValue
  field :overwrite_cache, 5, type: :bool, json_name: "overwriteCache"
  field :cluster, 6, type: :string
  field :raw_data_storage, 7, type: Flyteidl2.Task.RawDataStorage, json_name: "rawDataStorage"
  field :security_context, 8, type: Flyteidl2.Core.SecurityContext, json_name: "securityContext"
end
