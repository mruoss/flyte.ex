defmodule Flyteidl2.Imagebuilder.ImageIdentifier do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.imagebuilder.ImageIdentifier",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :name, 1, type: :string, deprecated: false
end

defmodule Flyteidl2.Imagebuilder.Image do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.imagebuilder.Image",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :id, 1, type: Flyteidl2.Imagebuilder.ImageIdentifier
  field :fqin, 2, type: :string
end

defmodule Flyteidl2.Imagebuilder.AptPackages do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.imagebuilder.AptPackages",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :packages, 1, repeated: true, type: :string
  field :secret_mounts, 2, repeated: true, type: Flyteidl2.Core.Secret, json_name: "secretMounts"
end

defmodule Flyteidl2.Imagebuilder.PipOptions do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.imagebuilder.PipOptions",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :index_url, 2, type: :string, json_name: "indexUrl"
  field :extra_index_urls, 3, repeated: true, type: :string, json_name: "extraIndexUrls"
  field :pre, 4, type: :bool
  field :extra_args, 5, type: :string, json_name: "extraArgs"
end

defmodule Flyteidl2.Imagebuilder.PipPackages do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.imagebuilder.PipPackages",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :packages, 1, repeated: true, type: :string
  field :options, 2, type: Flyteidl2.Imagebuilder.PipOptions
  field :secret_mounts, 3, repeated: true, type: Flyteidl2.Core.Secret, json_name: "secretMounts"
end

defmodule Flyteidl2.Imagebuilder.Requirements do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.imagebuilder.Requirements",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :file, 1, type: :string
  field :options, 2, type: Flyteidl2.Imagebuilder.PipOptions
  field :secret_mounts, 3, repeated: true, type: Flyteidl2.Core.Secret, json_name: "secretMounts"
end

defmodule Flyteidl2.Imagebuilder.PythonWheels do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.imagebuilder.PythonWheels",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :dir, 1, type: :string
  field :options, 2, type: Flyteidl2.Imagebuilder.PipOptions
  field :secret_mounts, 3, repeated: true, type: Flyteidl2.Core.Secret, json_name: "secretMounts"
end

defmodule Flyteidl2.Imagebuilder.UVProject do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.imagebuilder.UVProject",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :pyproject, 1, type: :string
  field :uvlock, 2, type: :string
  field :options, 3, type: Flyteidl2.Imagebuilder.PipOptions
  field :secret_mounts, 4, repeated: true, type: Flyteidl2.Core.Secret, json_name: "secretMounts"
end

defmodule Flyteidl2.Imagebuilder.Commands do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.imagebuilder.Commands",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :cmd, 2, repeated: true, type: :string
  field :secret_mounts, 3, repeated: true, type: Flyteidl2.Core.Secret, json_name: "secretMounts"
end

defmodule Flyteidl2.Imagebuilder.WorkDir do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.imagebuilder.WorkDir",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :workdir, 1, type: :string
end

defmodule Flyteidl2.Imagebuilder.CopyConfig do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.imagebuilder.CopyConfig",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :src, 1, type: :string
  field :dst, 2, type: :string
end

defmodule Flyteidl2.Imagebuilder.Env.EnvVariablesEntry do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.imagebuilder.Env.EnvVariablesEntry",
    map: true,
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :key, 1, type: :string
  field :value, 2, type: :string
end

defmodule Flyteidl2.Imagebuilder.Env do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.imagebuilder.Env",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :env_variables, 1,
    repeated: true,
    type: Flyteidl2.Imagebuilder.Env.EnvVariablesEntry,
    json_name: "envVariables",
    map: true
end

defmodule Flyteidl2.Imagebuilder.PoetryProject do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.imagebuilder.PoetryProject",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :pyproject, 1, type: :string
  field :poetry_lock, 2, type: :string, json_name: "poetryLock"
  field :extra_args, 3, type: :string, json_name: "extraArgs"
  field :secret_mounts, 4, repeated: true, type: Flyteidl2.Core.Secret, json_name: "secretMounts"
end

defmodule Flyteidl2.Imagebuilder.Layer do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.imagebuilder.Layer",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  oneof :layer, 0

  field :apt_packages, 1,
    type: Flyteidl2.Imagebuilder.AptPackages,
    json_name: "aptPackages",
    oneof: 0

  field :pip_packages, 2,
    type: Flyteidl2.Imagebuilder.PipPackages,
    json_name: "pipPackages",
    oneof: 0

  field :commands, 3, type: Flyteidl2.Imagebuilder.Commands, oneof: 0
  field :requirements, 4, type: Flyteidl2.Imagebuilder.Requirements, oneof: 0

  field :python_wheels, 5,
    type: Flyteidl2.Imagebuilder.PythonWheels,
    json_name: "pythonWheels",
    oneof: 0

  field :workdir, 6, type: Flyteidl2.Imagebuilder.WorkDir, oneof: 0

  field :copy_config, 7,
    type: Flyteidl2.Imagebuilder.CopyConfig,
    json_name: "copyConfig",
    oneof: 0

  field :uv_project, 8, type: Flyteidl2.Imagebuilder.UVProject, json_name: "uvProject", oneof: 0
  field :env, 9, type: Flyteidl2.Imagebuilder.Env, oneof: 0

  field :poetry_project, 10,
    type: Flyteidl2.Imagebuilder.PoetryProject,
    json_name: "poetryProject",
    oneof: 0
end

defmodule Flyteidl2.Imagebuilder.ImageSpec do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.imagebuilder.ImageSpec",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :base_image, 1, type: :string, json_name: "baseImage"
  field :python_version, 2, type: :string, json_name: "pythonVersion"
  field :layers, 3, repeated: true, type: Flyteidl2.Imagebuilder.Layer
  field :platform, 4, repeated: true, type: :string
end
