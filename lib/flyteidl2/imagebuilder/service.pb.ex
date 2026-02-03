defmodule Flyteidl2.Imagebuilder.ImageService.Service do
  @moduledoc false

  use GRPC.Service,
    name: "flyteidl2.imagebuilder.ImageService",
    protoc_gen_elixir_version: "0.16.0"

  rpc :GetImage, Flyteidl2.Imagebuilder.GetImageRequest, Flyteidl2.Imagebuilder.GetImageResponse
end

defmodule Flyteidl2.Imagebuilder.ImageService.Stub do
  @moduledoc false

  use GRPC.Stub, service: Flyteidl2.Imagebuilder.ImageService.Service
end
