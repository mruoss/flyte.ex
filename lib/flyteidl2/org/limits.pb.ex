defmodule Flyteidl2.Org.OrgLimitExceeded do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.org.OrgLimitExceeded",
    protoc_gen_elixir_version: "0.17.1",
    syntax: :proto3

  field :limit, 1, type: :string
  field :ceiling, 2, type: :int64
  field :current, 3, type: :int64
  field :requested, 4, type: :int64
  field :tier_default, 5, proto3_optional: true, type: :int64, json_name: "tierDefault"
  field :upgrade_url, 6, type: :string, json_name: "upgradeUrl"
  field :tier, 7, type: :string
end

defmodule Flyteidl2.Org.OrgEntitlementRequired do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.org.OrgEntitlementRequired",
    protoc_gen_elixir_version: "0.17.1",
    syntax: :proto3

  field :entitlement, 1, type: :string
  field :values, 2, repeated: true, type: :string
  field :upgrade_url, 3, type: :string, json_name: "upgradeUrl"
end
