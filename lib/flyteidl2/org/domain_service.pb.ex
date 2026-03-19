defmodule Flyteidl2.Org.ListDomainsRequest do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.org.ListDomainsRequest",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :org, 1, type: :string, deprecated: false
  field :include_settings, 2, type: :bool, json_name: "includeSettings"
end

defmodule Flyteidl2.Org.ListDomainsResponse do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.org.ListDomainsResponse",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :domains, 1, repeated: true, type: Flyteidl2.Org.Domain
end

defmodule Flyteidl2.Org.CreateDomainRequest do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.org.CreateDomainRequest",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :org, 1, type: :string, deprecated: false
  field :id, 2, type: :string, deprecated: false
  field :friendly_name, 3, type: :string, json_name: "friendlyName", deprecated: false
end

defmodule Flyteidl2.Org.CreateDomainResponse do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.org.CreateDomainResponse",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :domain, 1, type: Flyteidl2.Org.Domain
end

defmodule Flyteidl2.Org.GetDomainRequest do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.org.GetDomainRequest",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :org, 1, type: :string, deprecated: false
  field :id, 2, type: :string, deprecated: false
  field :include_settings, 3, type: :bool, json_name: "includeSettings"
end

defmodule Flyteidl2.Org.GetDomainResponse do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.org.GetDomainResponse",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :domain, 1, type: Flyteidl2.Org.Domain
end

defmodule Flyteidl2.Org.UpdateDomainRequest do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.org.UpdateDomainRequest",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :org, 1, type: :string, deprecated: false
  field :id, 2, type: :string, deprecated: false
  field :friendly_name, 3, type: :string, json_name: "friendlyName", deprecated: false
end

defmodule Flyteidl2.Org.UpdateDomainResponse do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.org.UpdateDomainResponse",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :domain, 1, type: Flyteidl2.Org.Domain
end

defmodule Flyteidl2.Org.DeleteDomainRequest do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.org.DeleteDomainRequest",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :org, 1, type: :string, deprecated: false
  field :id, 2, type: :string, deprecated: false
end

defmodule Flyteidl2.Org.DeleteDomainResponse do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.org.DeleteDomainResponse",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3
end

defmodule Flyteidl2.Org.DomainService.Service do
  @moduledoc false

  use GRPC.Service, name: "flyteidl2.org.DomainService", protoc_gen_elixir_version: "0.16.0"

  rpc :ListDomains, Flyteidl2.Org.ListDomainsRequest, Flyteidl2.Org.ListDomainsResponse

  rpc :CreateDomain, Flyteidl2.Org.CreateDomainRequest, Flyteidl2.Org.CreateDomainResponse

  rpc :GetDomain, Flyteidl2.Org.GetDomainRequest, Flyteidl2.Org.GetDomainResponse

  rpc :UpdateDomain, Flyteidl2.Org.UpdateDomainRequest, Flyteidl2.Org.UpdateDomainResponse

  rpc :DeleteDomain, Flyteidl2.Org.DeleteDomainRequest, Flyteidl2.Org.DeleteDomainResponse
end

defmodule Flyteidl2.Org.DomainService.Stub do
  @moduledoc false

  use GRPC.Stub, service: Flyteidl2.Org.DomainService.Service
end
