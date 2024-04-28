defmodule Flyteidl.Plugins.Sagemaker.HyperparameterScalingType.Value do
  @moduledoc false

  use Protobuf, enum: true, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :AUTO, 0
  field :LINEAR, 1
  field :LOGARITHMIC, 2
  field :REVERSELOGARITHMIC, 3
end

defmodule Flyteidl.Plugins.Sagemaker.HyperparameterScalingType do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"
end

defmodule Flyteidl.Plugins.Sagemaker.ContinuousParameterRange do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :max_value, 1, type: :double, json_name: "maxValue"
  field :min_value, 2, type: :double, json_name: "minValue"

  field :scaling_type, 3,
    type: Flyteidl.Plugins.Sagemaker.HyperparameterScalingType.Value,
    json_name: "scalingType",
    enum: true
end

defmodule Flyteidl.Plugins.Sagemaker.IntegerParameterRange do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :max_value, 1, type: :int64, json_name: "maxValue"
  field :min_value, 2, type: :int64, json_name: "minValue"

  field :scaling_type, 3,
    type: Flyteidl.Plugins.Sagemaker.HyperparameterScalingType.Value,
    json_name: "scalingType",
    enum: true
end

defmodule Flyteidl.Plugins.Sagemaker.CategoricalParameterRange do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :values, 1, repeated: true, type: :string
end

defmodule Flyteidl.Plugins.Sagemaker.ParameterRangeOneOf do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  oneof :parameter_range_type, 0

  field :continuous_parameter_range, 1,
    type: Flyteidl.Plugins.Sagemaker.ContinuousParameterRange,
    json_name: "continuousParameterRange",
    oneof: 0

  field :integer_parameter_range, 2,
    type: Flyteidl.Plugins.Sagemaker.IntegerParameterRange,
    json_name: "integerParameterRange",
    oneof: 0

  field :categorical_parameter_range, 3,
    type: Flyteidl.Plugins.Sagemaker.CategoricalParameterRange,
    json_name: "categoricalParameterRange",
    oneof: 0
end

defmodule Flyteidl.Plugins.Sagemaker.ParameterRanges.ParameterRangeMapEntry do
  @moduledoc false

  use Protobuf, map: true, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :key, 1, type: :string
  field :value, 2, type: Flyteidl.Plugins.Sagemaker.ParameterRangeOneOf
end

defmodule Flyteidl.Plugins.Sagemaker.ParameterRanges do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :parameter_range_map, 1,
    repeated: true,
    type: Flyteidl.Plugins.Sagemaker.ParameterRanges.ParameterRangeMapEntry,
    json_name: "parameterRangeMap",
    map: true
end