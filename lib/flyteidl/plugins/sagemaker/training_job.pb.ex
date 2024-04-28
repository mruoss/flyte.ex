defmodule Flyteidl.Plugins.Sagemaker.InputMode.Value do
  @moduledoc false

  use Protobuf, enum: true, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :FILE, 0
  field :PIPE, 1
end

defmodule Flyteidl.Plugins.Sagemaker.AlgorithmName.Value do
  @moduledoc false

  use Protobuf, enum: true, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :CUSTOM, 0
  field :XGBOOST, 1
end

defmodule Flyteidl.Plugins.Sagemaker.InputContentType.Value do
  @moduledoc false

  use Protobuf, enum: true, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :TEXT_CSV, 0
end

defmodule Flyteidl.Plugins.Sagemaker.DistributedProtocol.Value do
  @moduledoc false

  use Protobuf, enum: true, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :UNSPECIFIED, 0
  field :MPI, 1
end

defmodule Flyteidl.Plugins.Sagemaker.InputMode do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"
end

defmodule Flyteidl.Plugins.Sagemaker.AlgorithmName do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"
end

defmodule Flyteidl.Plugins.Sagemaker.InputContentType do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"
end

defmodule Flyteidl.Plugins.Sagemaker.MetricDefinition do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :name, 1, type: :string
  field :regex, 2, type: :string
end

defmodule Flyteidl.Plugins.Sagemaker.AlgorithmSpecification do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :input_mode, 1,
    type: Flyteidl.Plugins.Sagemaker.InputMode.Value,
    json_name: "inputMode",
    enum: true

  field :algorithm_name, 2,
    type: Flyteidl.Plugins.Sagemaker.AlgorithmName.Value,
    json_name: "algorithmName",
    enum: true

  field :algorithm_version, 3, type: :string, json_name: "algorithmVersion"

  field :metric_definitions, 4,
    repeated: true,
    type: Flyteidl.Plugins.Sagemaker.MetricDefinition,
    json_name: "metricDefinitions"

  field :input_content_type, 5,
    type: Flyteidl.Plugins.Sagemaker.InputContentType.Value,
    json_name: "inputContentType",
    enum: true
end

defmodule Flyteidl.Plugins.Sagemaker.DistributedProtocol do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"
end

defmodule Flyteidl.Plugins.Sagemaker.TrainingJobResourceConfig do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :instance_count, 1, type: :int64, json_name: "instanceCount"
  field :instance_type, 2, type: :string, json_name: "instanceType"
  field :volume_size_in_gb, 3, type: :int64, json_name: "volumeSizeInGb"

  field :distributed_protocol, 4,
    type: Flyteidl.Plugins.Sagemaker.DistributedProtocol.Value,
    json_name: "distributedProtocol",
    enum: true
end

defmodule Flyteidl.Plugins.Sagemaker.TrainingJob do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :algorithm_specification, 1,
    type: Flyteidl.Plugins.Sagemaker.AlgorithmSpecification,
    json_name: "algorithmSpecification"

  field :training_job_resource_config, 2,
    type: Flyteidl.Plugins.Sagemaker.TrainingJobResourceConfig,
    json_name: "trainingJobResourceConfig"
end