defmodule Flyteidl2.Logs.Dataplane.LogLineOriginator do
  @moduledoc false

  use Protobuf,
    enum: true,
    full_name: "flyteidl2.logs.dataplane.LogLineOriginator",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :UNKNOWN, 0
  field :USER, 1
  field :SYSTEM, 2
end

defmodule Flyteidl2.Logs.Dataplane.LogsSource do
  @moduledoc false

  use Protobuf,
    enum: true,
    full_name: "flyteidl2.logs.dataplane.LogsSource",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :LIVE_OR_PERSISTED, 0
  field :LIVE_ONLY, 1
  field :PERSISTED_ONLY, 2
end

defmodule Flyteidl2.Logs.Dataplane.PodResource do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.logs.dataplane.PodResource",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :namespace, 1, type: :string, deprecated: false
  field :name, 2, type: :string, deprecated: false
  field :container, 3, type: :string
end

defmodule Flyteidl2.Logs.Dataplane.LoggingContext.KubernetesPodLabelsEntry do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.logs.dataplane.LoggingContext.KubernetesPodLabelsEntry",
    map: true,
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :key, 1, type: :string
  field :value, 2, type: :string
end

defmodule Flyteidl2.Logs.Dataplane.LoggingContext do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.logs.dataplane.LoggingContext",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :cluster_name, 3, type: :string, json_name: "clusterName", deprecated: false

  field :kubernetes_namespace, 4,
    type: :string,
    json_name: "kubernetesNamespace",
    deprecated: false

  field :kubernetes_pod_name, 5, type: :string, json_name: "kubernetesPodName", deprecated: false

  field :kubernetes_container_name, 6,
    type: :string,
    json_name: "kubernetesContainerName",
    deprecated: false

  field :execution_attempt_start_time, 7,
    type: Google.Protobuf.Timestamp,
    json_name: "executionAttemptStartTime"

  field :execution_attempt_end_time, 8,
    type: Google.Protobuf.Timestamp,
    json_name: "executionAttemptEndTime"

  field :kubernetes_pod_labels, 9,
    repeated: true,
    type: Flyteidl2.Logs.Dataplane.LoggingContext.KubernetesPodLabelsEntry,
    json_name: "kubernetesPodLabels",
    map: true

  field :order, 10, type: Flyteidl2.Common.Sort.Direction, enum: true
  field :number_of_batches, 11, type: :uint64, json_name: "numberOfBatches"
end

defmodule Flyteidl2.Logs.Dataplane.ContainerIdentifier do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.logs.dataplane.ContainerIdentifier",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :cluster_name, 1, type: :string, json_name: "clusterName", deprecated: false

  field :kubernetes_namespace, 2,
    type: :string,
    json_name: "kubernetesNamespace",
    deprecated: false

  field :kubernetes_pod_name, 3, type: :string, json_name: "kubernetesPodName", deprecated: false
  field :kubernetes_container_name, 4, type: :string, json_name: "kubernetesContainerName"
end

defmodule Flyteidl2.Logs.Dataplane.ContainerSelector do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.logs.dataplane.ContainerSelector",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :cluster_name, 1, type: :string, json_name: "clusterName", deprecated: false

  field :kubernetes_namespace, 2,
    type: :string,
    json_name: "kubernetesNamespace",
    deprecated: false

  field :kubernetes_pod_name_prefix, 3, type: :string, json_name: "kubernetesPodNamePrefix"
  field :kubernetes_container_name, 4, type: :string, json_name: "kubernetesContainerName"
  field :kubernetes_pod_label_selector, 5, type: :string, json_name: "kubernetesPodLabelSelector"
end

defmodule Flyteidl2.Logs.Dataplane.LiveLogsOptions do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.logs.dataplane.LiveLogsOptions",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :log_pod_status, 1, type: :bool, json_name: "logPodStatus"
  field :log_timestamps, 2, type: :bool, json_name: "logTimestamps"
end

defmodule Flyteidl2.Logs.Dataplane.LogLine do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.logs.dataplane.LogLine",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :timestamp, 1, type: Google.Protobuf.Timestamp
  field :message, 2, type: :string
  field :originator, 3, type: Flyteidl2.Logs.Dataplane.LogLineOriginator, enum: true
end

defmodule Flyteidl2.Logs.Dataplane.LogLines do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.logs.dataplane.LogLines",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :lines, 1, repeated: true, type: :string, deprecated: true
  field :container_index, 2, type: :uint32, json_name: "containerIndex"
  field :container, 3, type: Flyteidl2.Logs.Dataplane.ContainerIdentifier, deprecated: false

  field :structured_lines, 4,
    repeated: true,
    type: Flyteidl2.Logs.Dataplane.LogLine,
    json_name: "structuredLines"
end

defmodule Flyteidl2.Logs.Dataplane.LogContainersList do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.logs.dataplane.LogContainersList",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :containers, 1, repeated: true, type: Flyteidl2.Logs.Dataplane.ContainerIdentifier
end

defmodule Flyteidl2.Logs.Dataplane.LogLinesBatch do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.logs.dataplane.LogLinesBatch",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :logs, 1, repeated: true, type: Flyteidl2.Logs.Dataplane.LogLines
end
