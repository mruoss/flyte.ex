defmodule Flyteidl2.Task.FixedRateUnit do
  @moduledoc false

  use Protobuf, enum: true, protoc_gen_elixir_version: "0.15.0", syntax: :proto3

  field :FIXED_RATE_UNIT_UNSPECIFIED, 0
  field :FIXED_RATE_UNIT_MINUTE, 1
  field :FIXED_RATE_UNIT_HOUR, 2
  field :FIXED_RATE_UNIT_DAY, 3
end

defmodule Flyteidl2.Task.TriggerAutomationSpec.Type do
  @moduledoc false

  use Protobuf, enum: true, protoc_gen_elixir_version: "0.15.0", syntax: :proto3

  field :TYPE_UNSPECIFIED, 0
  field :TYPE_NONE, 1
  field :TYPE_SCHEDULE, 2
end

defmodule Flyteidl2.Task.NamedParameter do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.15.0", syntax: :proto3

  field :name, 1, type: :string
  field :parameter, 2, type: Flyteidl2.Core.Parameter
end

defmodule Flyteidl2.Task.FixedRate do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.15.0", syntax: :proto3

  field :value, 1, type: :uint32, deprecated: false
  field :unit, 2, type: Flyteidl2.Task.FixedRateUnit, enum: true, deprecated: false
  field :start_time, 3, type: Google.Protobuf.Timestamp, json_name: "startTime"
end

defmodule Flyteidl2.Task.Schedule do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.15.0", syntax: :proto3

  oneof :expression, 0

  field :rate, 1, type: Flyteidl2.Task.FixedRate, oneof: 0
  field :cron_expression, 2, type: :string, json_name: "cronExpression", oneof: 0
  field :kickoff_time_input_arg, 3, type: :string, json_name: "kickoffTimeInputArg"
end

defmodule Flyteidl2.Task.TriggerAutomationSpec do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.15.0", syntax: :proto3

  oneof :automation, 0

  field :type, 1, type: Flyteidl2.Task.TriggerAutomationSpec.Type, enum: true, deprecated: false
  field :schedule, 2, type: Flyteidl2.Task.Schedule, oneof: 0
end

defmodule Flyteidl2.Task.NamedLiteral do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.15.0", syntax: :proto3

  field :name, 1, type: :string
  field :value, 2, type: Flyteidl2.Core.Literal
end

defmodule Flyteidl2.Task.OutputReferences do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.15.0", syntax: :proto3

  field :output_uri, 1, type: :string, json_name: "outputUri"
  field :report_uri, 2, type: :string, json_name: "reportUri"
end

defmodule Flyteidl2.Task.Inputs do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.15.0", syntax: :proto3

  field :literals, 1, repeated: true, type: Flyteidl2.Task.NamedLiteral
  field :context, 2, repeated: true, type: Flyteidl2.Core.KeyValuePair
end

defmodule Flyteidl2.Task.Outputs do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.15.0", syntax: :proto3

  field :literals, 1, repeated: true, type: Flyteidl2.Task.NamedLiteral
end
