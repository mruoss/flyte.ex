# Flyte

Elixir files generated from [Flyte's protobuf files](https://github.com/flyteorg/flyteidl) using [protobuf-elixir](https://github.com/elixir-protobuf/protobuf).

[![Module Version](https://img.shields.io/hexpm/v/flyte.svg)](https://hex.pm/packages/flyte)
[![Last Updated](https://img.shields.io/github/last-commit/mruoss/flyte.ex.svg)](https://github.com/mruoss/flyte.ex/commits/main)

[![Upstream Version Check](https://github.com/mruoss/flyte.ex/actions/workflows/update.yaml/badge.svg)](https://github.com/mruoss/flyte.ex/actions/workflows/update.yaml)

[![License](https://img.shields.io/hexpm/l/flyte.svg)](https://github.com/mruoss/flyte.ex/blob/main/LICENSE)

## Installation

Install by adding `flyte` to your list of dependencies in `mix.exs`.
Additionally to `flyte`, you're gonna need `google_protos`:

```elixir
def deps do
  [
    {:flyte, "~> 1.5"},
    {:google_protos, "~> 0.3.0"}
  ]
end
```

## Usage Example

```elixir
{:ok, channel} = GRPC.Stub.connect("localhost:30080")
id = %Flyteidl.Core.Identifier{
  resource_type: :TASK,
  project: "flytesnacks",
  domain: "development",
  name: "TASK_NAME",
  version: "TASK_VERSION"
}

req = %Flyteidl.Admin.ObjectGetRequest{id: id}
Flyteidl.Service.AdminService.Stub.get_task(channel, req)
```
