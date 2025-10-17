defmodule Flyteidl2.Common.User do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.15.0", syntax: :proto3

  field :id, 1, type: Flyteidl2.Common.UserIdentifier
  field :spec, 2, type: Flyteidl2.Common.UserSpec
  field :roles, 3, repeated: true, type: Flyteidl2.Common.Role, deprecated: true
  field :policies, 4, repeated: true, type: Flyteidl2.Common.Policy
end

defmodule Flyteidl2.Common.UserSpec do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.15.0", syntax: :proto3

  field :first_name, 1, type: :string, json_name: "firstName"
  field :last_name, 2, type: :string, json_name: "lastName"
  field :email, 3, type: :string
  field :organization, 4, type: :string
  field :user_handle, 5, type: :string, json_name: "userHandle"
  field :groups, 6, repeated: true, type: :string
  field :photo_url, 7, type: :string, json_name: "photoUrl"
end

defmodule Flyteidl2.Common.Application do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.15.0", syntax: :proto3

  field :id, 1, type: Flyteidl2.Common.ApplicationIdentifier
  field :spec, 2, type: Flyteidl2.Common.AppSpec
end

defmodule Flyteidl2.Common.AppSpec do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.15.0", syntax: :proto3

  field :name, 1, type: :string
  field :organization, 2, type: :string
end

defmodule Flyteidl2.Common.EnrichedIdentity do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.15.0", syntax: :proto3

  oneof :principal, 0

  field :user, 1, type: Flyteidl2.Common.User, oneof: 0
  field :application, 2, type: Flyteidl2.Common.Application, oneof: 0
end

defmodule Flyteidl2.Common.Identity do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.15.0", syntax: :proto3

  oneof :principal, 0

  field :user_id, 1, type: Flyteidl2.Common.UserIdentifier, json_name: "userId", oneof: 0

  field :application_id, 2,
    type: Flyteidl2.Common.ApplicationIdentifier,
    json_name: "applicationId",
    oneof: 0
end
