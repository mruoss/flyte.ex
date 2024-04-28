defmodule Flyteidl.Plugins.Sagemaker.HyperparameterTuningObjectiveType.Value do
  @moduledoc false

  use Protobuf, enum: true, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :MINIMIZE, 0
  field :MAXIMIZE, 1
end

defmodule Flyteidl.Plugins.Sagemaker.HyperparameterTuningStrategy.Value do
  @moduledoc false

  use Protobuf, enum: true, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :BAYESIAN, 0
  field :RANDOM, 1
end

defmodule Flyteidl.Plugins.Sagemaker.TrainingJobEarlyStoppingType.Value do
  @moduledoc false

  use Protobuf, enum: true, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :OFF, 0
  field :AUTO, 1
end

defmodule Flyteidl.Plugins.Sagemaker.HyperparameterTuningJob do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :training_job, 1, type: Flyteidl.Plugins.Sagemaker.TrainingJob, json_name: "trainingJob"
  field :max_number_of_training_jobs, 2, type: :int64, json_name: "maxNumberOfTrainingJobs"
  field :max_parallel_training_jobs, 3, type: :int64, json_name: "maxParallelTrainingJobs"
end

defmodule Flyteidl.Plugins.Sagemaker.HyperparameterTuningObjectiveType do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"
end

defmodule Flyteidl.Plugins.Sagemaker.HyperparameterTuningObjective do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :objective_type, 1,
    type: Flyteidl.Plugins.Sagemaker.HyperparameterTuningObjectiveType.Value,
    json_name: "objectiveType",
    enum: true

  field :metric_name, 2, type: :string, json_name: "metricName"
end

defmodule Flyteidl.Plugins.Sagemaker.HyperparameterTuningStrategy do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"
end

defmodule Flyteidl.Plugins.Sagemaker.TrainingJobEarlyStoppingType do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"
end

defmodule Flyteidl.Plugins.Sagemaker.HyperparameterTuningJobConfig do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :hyperparameter_ranges, 1,
    type: Flyteidl.Plugins.Sagemaker.ParameterRanges,
    json_name: "hyperparameterRanges"

  field :tuning_strategy, 2,
    type: Flyteidl.Plugins.Sagemaker.HyperparameterTuningStrategy.Value,
    json_name: "tuningStrategy",
    enum: true

  field :tuning_objective, 3,
    type: Flyteidl.Plugins.Sagemaker.HyperparameterTuningObjective,
    json_name: "tuningObjective"

  field :training_job_early_stopping_type, 4,
    type: Flyteidl.Plugins.Sagemaker.TrainingJobEarlyStoppingType.Value,
    json_name: "trainingJobEarlyStoppingType",
    enum: true
end