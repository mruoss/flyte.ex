defmodule Flyteidl2.Imagebuilder.GetImageRequest do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.15.0", syntax: :proto3

  field :id, 1, type: Flyteidl2.Imagebuilder.ImageIdentifier, deprecated: false
  field :organization, 2, type: :string
end

defmodule Flyteidl2.Imagebuilder.GetImageResponse do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.15.0", syntax: :proto3

  field :image, 1, type: Flyteidl2.Imagebuilder.Image
end
