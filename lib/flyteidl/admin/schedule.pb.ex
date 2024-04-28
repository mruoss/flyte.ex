defmodule Flyteidl.Admin.FixedRateUnit do
  @moduledoc false

  use Protobuf, enum: true, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :MINUTE, 0
  field :HOUR, 1
  field :DAY, 2
end

defmodule Flyteidl.Admin.FixedRate do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :value, 1, type: :uint32
  field :unit, 2, type: Flyteidl.Admin.FixedRateUnit, enum: true
end

defmodule Flyteidl.Admin.CronSchedule do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :schedule, 1, type: :string
  field :offset, 2, type: :string
end

defmodule Flyteidl.Admin.Schedule do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  oneof :ScheduleExpression, 0

  field :cron_expression, 1,
    type: :string,
    json_name: "cronExpression",
    oneof: 0,
    deprecated: true

  field :rate, 2, type: Flyteidl.Admin.FixedRate, oneof: 0
  field :cron_schedule, 4, type: Flyteidl.Admin.CronSchedule, json_name: "cronSchedule", oneof: 0
  field :kickoff_time_input_arg, 3, type: :string, json_name: "kickoffTimeInputArg"
end