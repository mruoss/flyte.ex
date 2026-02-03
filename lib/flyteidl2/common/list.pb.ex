defmodule Flyteidl2.Common.Sort.Direction do
  @moduledoc false

  use Protobuf,
    enum: true,
    full_name: "flyteidl2.common.Sort.Direction",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :DESCENDING, 0
  field :ASCENDING, 1
end

defmodule Flyteidl2.Common.Filter.Function do
  @moduledoc false

  use Protobuf,
    enum: true,
    full_name: "flyteidl2.common.Filter.Function",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :EQUAL, 0
  field :NOT_EQUAL, 1
  field :GREATER_THAN, 2
  field :GREATER_THAN_OR_EQUAL, 3
  field :LESS_THAN, 4
  field :LESS_THAN_OR_EQUAL, 5
  field :CONTAINS, 6
  field :VALUE_IN, 7
  field :ENDS_WITH, 12
  field :NOT_ENDS_WITH, 13
  field :CONTAINS_CASE_INSENSITIVE, 14
end

defmodule Flyteidl2.Common.Sort do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.common.Sort",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :key, 1, type: :string
  field :direction, 2, type: Flyteidl2.Common.Sort.Direction, enum: true
end

defmodule Flyteidl2.Common.ListRequest do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.common.ListRequest",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :limit, 1, type: :uint32
  field :token, 2, type: :string
  field :sort_by, 3, type: Flyteidl2.Common.Sort, json_name: "sortBy", deprecated: true
  field :filters, 4, repeated: true, type: Flyteidl2.Common.Filter
  field :raw_filters, 5, repeated: true, type: :string, json_name: "rawFilters"
  field :sort_by_fields, 6, repeated: true, type: Flyteidl2.Common.Sort, json_name: "sortByFields"
end

defmodule Flyteidl2.Common.Filter do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.common.Filter",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :function, 1, type: Flyteidl2.Common.Filter.Function, enum: true
  field :field, 2, type: :string
  field :values, 3, repeated: true, type: :string
end
