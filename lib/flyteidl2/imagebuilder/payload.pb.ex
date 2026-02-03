defmodule Flyteidl2.Imagebuilder.GetImageRequest do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.imagebuilder.GetImageRequest",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :id, 1, type: Flyteidl2.Imagebuilder.ImageIdentifier, deprecated: false
  field :organization, 2, type: :string, deprecated: true
  field :project_id, 3, type: Flyteidl2.Common.ProjectIdentifier, json_name: "projectId"
end

defmodule Flyteidl2.Imagebuilder.GetImageResponse do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.imagebuilder.GetImageResponse",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :image, 1, type: Flyteidl2.Imagebuilder.Image
end
