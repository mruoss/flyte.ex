defmodule Flyteidl2.Plugins.SparkApplication.Type do
  @moduledoc false

  use Protobuf,
    enum: true,
    full_name: "flyteidl2.plugins.SparkApplication.Type",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :PYTHON, 0
  field :JAVA, 1
  field :SCALA, 2
  field :R, 3
end

defmodule Flyteidl2.Plugins.SparkApplication do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.plugins.SparkApplication",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3
end

defmodule Flyteidl2.Plugins.SparkJob.SparkConfEntry do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.plugins.SparkJob.SparkConfEntry",
    map: true,
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :key, 1, type: :string
  field :value, 2, type: :string
end

defmodule Flyteidl2.Plugins.SparkJob.HadoopConfEntry do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.plugins.SparkJob.HadoopConfEntry",
    map: true,
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :key, 1, type: :string
  field :value, 2, type: :string
end

defmodule Flyteidl2.Plugins.SparkJob do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.plugins.SparkJob",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :applicationType, 1, type: Flyteidl2.Plugins.SparkApplication.Type, enum: true
  field :mainApplicationFile, 2, type: :string
  field :mainClass, 3, type: :string
  field :sparkConf, 4, repeated: true, type: Flyteidl2.Plugins.SparkJob.SparkConfEntry, map: true

  field :hadoopConf, 5,
    repeated: true,
    type: Flyteidl2.Plugins.SparkJob.HadoopConfEntry,
    map: true

  field :executorPath, 6, type: :string
  field :databricksConf, 7, type: Google.Protobuf.Struct
  field :databricksToken, 8, type: :string
  field :databricksInstance, 9, type: :string
  field :driverPod, 10, type: Flyteidl2.Core.K8sPod
  field :executorPod, 11, type: Flyteidl2.Core.K8sPod
end
