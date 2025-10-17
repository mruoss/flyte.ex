defmodule Flyteidl2.Core.Granularity do
  @moduledoc false

  use Protobuf, enum: true, protoc_gen_elixir_version: "0.15.0", syntax: :proto3

  field :UNSET, 0
  field :MINUTE, 1
  field :HOUR, 2
  field :DAY, 3
  field :MONTH, 4
end

defmodule Flyteidl2.Core.Operator do
  @moduledoc false

  use Protobuf, enum: true, protoc_gen_elixir_version: "0.15.0", syntax: :proto3

  field :MINUS, 0
  field :PLUS, 1
end

defmodule Flyteidl2.Core.ArtifactKey do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.15.0", syntax: :proto3

  field :project, 1, type: :string
  field :domain, 2, type: :string
  field :name, 3, type: :string
  field :org, 4, type: :string
end

defmodule Flyteidl2.Core.ArtifactBindingData do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.15.0", syntax: :proto3

  oneof :partition_data, 0

  field :partition_key, 5, type: :string, json_name: "partitionKey", oneof: 0
  field :bind_to_time_partition, 6, type: :bool, json_name: "bindToTimePartition", oneof: 0
  field :time_transform, 7, type: Flyteidl2.Core.TimeTransform, json_name: "timeTransform"
end

defmodule Flyteidl2.Core.TimeTransform do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.15.0", syntax: :proto3

  field :transform, 1, type: :string
  field :op, 2, type: Flyteidl2.Core.Operator, enum: true
end

defmodule Flyteidl2.Core.InputBindingData do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.15.0", syntax: :proto3

  field :var, 1, type: :string
end

defmodule Flyteidl2.Core.RuntimeBinding do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.15.0", syntax: :proto3
end

defmodule Flyteidl2.Core.LabelValue do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.15.0", syntax: :proto3

  oneof :value, 0

  field :static_value, 1, type: :string, json_name: "staticValue", oneof: 0
  field :time_value, 2, type: Google.Protobuf.Timestamp, json_name: "timeValue", oneof: 0

  field :triggered_binding, 3,
    type: Flyteidl2.Core.ArtifactBindingData,
    json_name: "triggeredBinding",
    oneof: 0

  field :input_binding, 4,
    type: Flyteidl2.Core.InputBindingData,
    json_name: "inputBinding",
    oneof: 0

  field :runtime_binding, 5,
    type: Flyteidl2.Core.RuntimeBinding,
    json_name: "runtimeBinding",
    oneof: 0
end

defmodule Flyteidl2.Core.Partitions.ValueEntry do
  @moduledoc false

  use Protobuf, map: true, protoc_gen_elixir_version: "0.15.0", syntax: :proto3

  field :key, 1, type: :string
  field :value, 2, type: Flyteidl2.Core.LabelValue
end

defmodule Flyteidl2.Core.Partitions do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.15.0", syntax: :proto3

  field :value, 1, repeated: true, type: Flyteidl2.Core.Partitions.ValueEntry, map: true
end

defmodule Flyteidl2.Core.TimePartition do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.15.0", syntax: :proto3

  field :value, 1, type: Flyteidl2.Core.LabelValue
  field :granularity, 2, type: Flyteidl2.Core.Granularity, enum: true
end

defmodule Flyteidl2.Core.ArtifactID do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.15.0", syntax: :proto3

  field :artifact_key, 1, type: Flyteidl2.Core.ArtifactKey, json_name: "artifactKey"
  field :version, 2, type: :string
  field :partitions, 3, type: Flyteidl2.Core.Partitions
  field :time_partition, 4, type: Flyteidl2.Core.TimePartition, json_name: "timePartition"
end

defmodule Flyteidl2.Core.ArtifactTag do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.15.0", syntax: :proto3

  field :artifact_key, 1, type: Flyteidl2.Core.ArtifactKey, json_name: "artifactKey"
  field :value, 2, type: Flyteidl2.Core.LabelValue
end

defmodule Flyteidl2.Core.ArtifactQuery do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.15.0", syntax: :proto3

  oneof :identifier, 0

  field :artifact_id, 1, type: Flyteidl2.Core.ArtifactID, json_name: "artifactId", oneof: 0
  field :artifact_tag, 2, type: Flyteidl2.Core.ArtifactTag, json_name: "artifactTag", oneof: 0
  field :uri, 3, type: :string, oneof: 0
  field :binding, 4, type: Flyteidl2.Core.ArtifactBindingData, oneof: 0
end
