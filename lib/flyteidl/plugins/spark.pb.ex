defmodule Flyteidl.Plugins.SparkApplication.Type do
  @moduledoc false

  use Protobuf, enum: true, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :PYTHON, 0
  field :JAVA, 1
  field :SCALA, 2
  field :R, 3
end

defmodule Flyteidl.Plugins.SparkApplication do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"
end

defmodule Flyteidl.Plugins.SparkJob.SparkConfEntry do
  @moduledoc false

  use Protobuf, map: true, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :key, 1, type: :string
  field :value, 2, type: :string
end

defmodule Flyteidl.Plugins.SparkJob.HadoopConfEntry do
  @moduledoc false

  use Protobuf, map: true, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :key, 1, type: :string
  field :value, 2, type: :string
end

defmodule Flyteidl.Plugins.SparkJob do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :applicationType, 1, type: Flyteidl.Plugins.SparkApplication.Type, enum: true
  field :mainApplicationFile, 2, type: :string
  field :mainClass, 3, type: :string
  field :sparkConf, 4, repeated: true, type: Flyteidl.Plugins.SparkJob.SparkConfEntry, map: true
  field :hadoopConf, 5, repeated: true, type: Flyteidl.Plugins.SparkJob.HadoopConfEntry, map: true
  field :executorPath, 6, type: :string
  field :databricksConf, 7, type: Google.Protobuf.Struct
  field :databricksToken, 8, type: :string
  field :databricksInstance, 9, type: :string
end