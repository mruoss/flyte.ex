defmodule Flyteidl.Core.ComparisonExpression.Operator do
  @moduledoc false

  use Protobuf, enum: true, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :EQ, 0
  field :NEQ, 1
  field :GT, 2
  field :GTE, 3
  field :LT, 4
  field :LTE, 5
end

defmodule Flyteidl.Core.ConjunctionExpression.LogicalOperator do
  @moduledoc false

  use Protobuf, enum: true, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :AND, 0
  field :OR, 1
end

defmodule Flyteidl.Core.ComparisonExpression do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :operator, 1, type: Flyteidl.Core.ComparisonExpression.Operator, enum: true
  field :left_value, 2, type: Flyteidl.Core.Operand, json_name: "leftValue"
  field :right_value, 3, type: Flyteidl.Core.Operand, json_name: "rightValue"
end

defmodule Flyteidl.Core.Operand do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  oneof :val, 0

  field :primitive, 1, type: Flyteidl.Core.Primitive, oneof: 0, deprecated: true
  field :var, 2, type: :string, oneof: 0
  field :scalar, 3, type: Flyteidl.Core.Scalar, oneof: 0
end

defmodule Flyteidl.Core.BooleanExpression do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  oneof :expr, 0

  field :conjunction, 1, type: Flyteidl.Core.ConjunctionExpression, oneof: 0
  field :comparison, 2, type: Flyteidl.Core.ComparisonExpression, oneof: 0
end

defmodule Flyteidl.Core.ConjunctionExpression do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :operator, 1, type: Flyteidl.Core.ConjunctionExpression.LogicalOperator, enum: true
  field :left_expression, 2, type: Flyteidl.Core.BooleanExpression, json_name: "leftExpression"
  field :right_expression, 3, type: Flyteidl.Core.BooleanExpression, json_name: "rightExpression"
end