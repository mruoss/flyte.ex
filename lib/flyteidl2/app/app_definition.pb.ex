defmodule Flyteidl2.App.Status.DeploymentStatus do
  @moduledoc false

  use Protobuf, enum: true, protoc_gen_elixir_version: "0.15.0", syntax: :proto3

  field :DEPLOYMENT_STATUS_UNSPECIFIED, 0
  field :DEPLOYMENT_STATUS_UNASSIGNED, 1
  field :DEPLOYMENT_STATUS_ASSIGNED, 2
  field :DEPLOYMENT_STATUS_PENDING, 3
  field :DEPLOYMENT_STATUS_STOPPED, 4
  field :DEPLOYMENT_STATUS_STARTED, 5
  field :DEPLOYMENT_STATUS_FAILED, 6
  field :DEPLOYMENT_STATUS_ACTIVE, 7
  field :DEPLOYMENT_STATUS_SCALING_UP, 8
  field :DEPLOYMENT_STATUS_SCALING_DOWN, 9
  field :DEPLOYMENT_STATUS_DEPLOYING, 10
end

defmodule Flyteidl2.App.Spec.DesiredState do
  @moduledoc false

  use Protobuf, enum: true, protoc_gen_elixir_version: "0.15.0", syntax: :proto3

  field :DESIRED_STATE_UNSPECIFIED, 0
  field :DESIRED_STATE_STOPPED, 1
  field :DESIRED_STATE_STARTED, 2
  field :DESIRED_STATE_ACTIVE, 3
end

defmodule Flyteidl2.App.Identifier do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.15.0", syntax: :proto3

  field :org, 1, type: :string
  field :project, 2, type: :string, deprecated: false
  field :domain, 3, type: :string, deprecated: false
  field :name, 4, type: :string, deprecated: false
end

defmodule Flyteidl2.App.Meta.LabelsEntry do
  @moduledoc false

  use Protobuf, map: true, protoc_gen_elixir_version: "0.15.0", syntax: :proto3

  field :key, 1, type: :string
  field :value, 2, type: :string
end

defmodule Flyteidl2.App.Meta do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.15.0", syntax: :proto3

  field :id, 1, type: Flyteidl2.App.Identifier, deprecated: false
  field :revision, 2, type: :uint64, deprecated: false
  field :labels, 3, repeated: true, type: Flyteidl2.App.Meta.LabelsEntry, map: true
end

defmodule Flyteidl2.App.AppWrapper do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.15.0", syntax: :proto3

  oneof :payload, 0

  field :host, 1, type: :string
  field :app, 2, type: Flyteidl2.App.App, oneof: 0
  field :app_id, 3, type: Flyteidl2.App.Identifier, json_name: "appId", oneof: 0
end

defmodule Flyteidl2.App.App do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.15.0", syntax: :proto3

  field :metadata, 1, type: Flyteidl2.App.Meta, deprecated: false
  field :spec, 2, type: Flyteidl2.App.Spec, deprecated: false
  field :status, 3, type: Flyteidl2.App.Status
end

defmodule Flyteidl2.App.Condition do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.15.0", syntax: :proto3

  field :last_transition_time, 1, type: Google.Protobuf.Timestamp, json_name: "lastTransitionTime"

  field :deployment_status, 2,
    type: Flyteidl2.App.Status.DeploymentStatus,
    json_name: "deploymentStatus",
    enum: true

  field :message, 3, type: :string
  field :revision, 4, type: :uint64, deprecated: false
  field :actor, 5, type: Flyteidl2.Common.EnrichedIdentity
end

defmodule Flyteidl2.App.Status do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.15.0", syntax: :proto3

  field :assigned_cluster, 1, type: :string, json_name: "assignedCluster"
  field :current_replicas, 2, type: :uint32, json_name: "currentReplicas", deprecated: false
  field :ingress, 3, type: Flyteidl2.App.Ingress
  field :created_at, 4, type: Google.Protobuf.Timestamp, json_name: "createdAt"
  field :last_updated_at, 5, type: Google.Protobuf.Timestamp, json_name: "lastUpdatedAt"
  field :conditions, 6, repeated: true, type: Flyteidl2.App.Condition
  field :lease_expiration, 7, type: Google.Protobuf.Timestamp, json_name: "leaseExpiration"
  field :k8s_metadata, 8, type: Flyteidl2.App.K8sMetadata, json_name: "k8sMetadata"

  field :materialized_inputs, 9,
    type: Flyteidl2.App.MaterializedInputs,
    json_name: "materializedInputs"
end

defmodule Flyteidl2.App.K8sMetadata do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.15.0", syntax: :proto3

  field :namespace, 1, type: :string
end

defmodule Flyteidl2.App.Ingress do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.15.0", syntax: :proto3

  field :public_url, 1, type: :string, json_name: "publicUrl", deprecated: false
  field :cname_url, 2, type: :string, json_name: "cnameUrl", deprecated: false
  field :vpc_url, 3, type: :string, json_name: "vpcUrl", deprecated: false
end

defmodule Flyteidl2.App.Spec do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.15.0", syntax: :proto3

  oneof :app_payload, 0

  field :container, 1, type: Flyteidl2.Core.Container, oneof: 0
  field :pod, 2, type: Flyteidl2.Core.K8sPod, oneof: 0
  field :autoscaling, 3, type: Flyteidl2.App.AutoscalingConfig
  field :ingress, 4, type: Flyteidl2.App.IngressConfig

  field :desired_state, 5,
    type: Flyteidl2.App.Spec.DesiredState,
    json_name: "desiredState",
    enum: true

  field :cluster_pool, 6, type: :string, json_name: "clusterPool"
  field :images, 7, type: Flyteidl2.App.ImageSpecSet
  field :security_context, 8, type: Flyteidl2.App.SecurityContext, json_name: "securityContext"

  field :extended_resources, 9,
    type: Flyteidl2.Core.ExtendedResources,
    json_name: "extendedResources"

  field :runtime_metadata, 10,
    type: Flyteidl2.Common.RuntimeMetadata,
    json_name: "runtimeMetadata"

  field :profile, 11, type: Flyteidl2.App.Profile
  field :creator, 12, type: Flyteidl2.Common.EnrichedIdentity
  field :inputs, 13, type: Flyteidl2.App.InputList
  field :links, 14, repeated: true, type: Flyteidl2.App.Link
  field :timeouts, 15, type: Flyteidl2.App.TimeoutConfig
end

defmodule Flyteidl2.App.Link do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.15.0", syntax: :proto3

  field :path, 1, type: :string, deprecated: false
  field :title, 2, type: :string
  field :is_relative, 3, type: :bool, json_name: "isRelative"
end

defmodule Flyteidl2.App.Input do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.15.0", syntax: :proto3

  oneof :value, 0

  field :name, 1, type: :string, deprecated: false
  field :string_value, 2, type: :string, json_name: "stringValue", oneof: 0, deprecated: false

  field :artifact_query, 3,
    type: Flyteidl2.Core.ArtifactQuery,
    json_name: "artifactQuery",
    oneof: 0

  field :artifact_id, 4, type: Flyteidl2.Core.ArtifactID, json_name: "artifactId", oneof: 0
  field :app_id, 5, type: Flyteidl2.App.Identifier, json_name: "appId", oneof: 0
end

defmodule Flyteidl2.App.MaterializedInputs do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.15.0", syntax: :proto3

  field :items, 1, repeated: true, type: Flyteidl2.App.MaterializedInput
  field :revision, 2, type: :uint64, deprecated: false
end

defmodule Flyteidl2.App.MaterializedInput do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.15.0", syntax: :proto3

  oneof :value, 0

  field :name, 1, type: :string, deprecated: false
  field :artifact_id, 2, type: Flyteidl2.Core.ArtifactID, json_name: "artifactId", oneof: 0
end

defmodule Flyteidl2.App.InputList do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.15.0", syntax: :proto3

  field :items, 1, repeated: true, type: Flyteidl2.App.Input
end

defmodule Flyteidl2.App.Profile do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.15.0", syntax: :proto3

  field :type, 1, type: :string
  field :name, 2, type: :string
  field :short_description, 3, type: :string, json_name: "shortDescription", deprecated: false
  field :icon_url, 4, type: :string, json_name: "iconUrl"
end

defmodule Flyteidl2.App.SecurityContext do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.15.0", syntax: :proto3

  field :run_as, 1, type: Flyteidl2.Core.Identity, json_name: "runAs"
  field :secrets, 2, repeated: true, type: Flyteidl2.Core.Secret
  field :allow_anonymous, 5, type: :bool, json_name: "allowAnonymous"
end

defmodule Flyteidl2.App.ImageSpec do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.15.0", syntax: :proto3

  field :tag, 1, type: :string
  field :build_job_url, 2, type: :string, json_name: "buildJobUrl"
end

defmodule Flyteidl2.App.ImageSpecSet do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.15.0", syntax: :proto3

  field :images, 1, repeated: true, type: Flyteidl2.App.ImageSpec
end

defmodule Flyteidl2.App.IngressConfig do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.15.0", syntax: :proto3

  field :private, 1, type: :bool
  field :subdomain, 2, type: :string
  field :cname, 3, type: :string
end

defmodule Flyteidl2.App.AutoscalingConfig do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.15.0", syntax: :proto3

  field :replicas, 1, type: Flyteidl2.App.Replicas
  field :scaledown_period, 2, type: Google.Protobuf.Duration, json_name: "scaledownPeriod"
  field :scaling_metric, 3, type: Flyteidl2.App.ScalingMetric, json_name: "scalingMetric"
end

defmodule Flyteidl2.App.ScalingMetric do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.15.0", syntax: :proto3

  oneof :metric, 0

  field :request_rate, 1, type: Flyteidl2.App.RequestRate, json_name: "requestRate", oneof: 0
  field :concurrency, 2, type: Flyteidl2.App.Concurrency, oneof: 0
end

defmodule Flyteidl2.App.Concurrency do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.15.0", syntax: :proto3

  field :target_value, 1, type: :uint32, json_name: "targetValue", deprecated: false
end

defmodule Flyteidl2.App.RequestRate do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.15.0", syntax: :proto3

  field :target_value, 1, type: :uint32, json_name: "targetValue", deprecated: false
end

defmodule Flyteidl2.App.Replicas do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.15.0", syntax: :proto3

  field :min, 1, type: :uint32, deprecated: false
  field :max, 2, type: :uint32, deprecated: false
end

defmodule Flyteidl2.App.TimeoutConfig do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.15.0", syntax: :proto3

  field :request_timeout, 1,
    type: Google.Protobuf.Duration,
    json_name: "requestTimeout",
    deprecated: false
end
