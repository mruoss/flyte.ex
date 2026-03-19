defmodule Flyteidl2.Notification.EventType do
  @moduledoc false

  use Protobuf,
    enum: true,
    full_name: "flyteidl2.notification.EventType",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :EVENT_TYPE_UNSPECIFIED, 0
  field :EVENT_TYPE_RUN_COMPLETED, 1
end

defmodule Flyteidl2.Notification.HttpMethod do
  @moduledoc false

  use Protobuf,
    enum: true,
    full_name: "flyteidl2.notification.HttpMethod",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :HTTP_METHOD_UNSPECIFIED, 0
  field :HTTP_METHOD_GET, 1
  field :HTTP_METHOD_HEAD, 2
  field :HTTP_METHOD_POST, 3
  field :HTTP_METHOD_PUT, 4
  field :HTTP_METHOD_DELETE, 5
  field :HTTP_METHOD_CONNECT, 6
  field :HTTP_METHOD_OPTIONS, 7
  field :HTTP_METHOD_TRACE, 8
  field :HTTP_METHOD_PATCH, 9
end

defmodule Flyteidl2.Notification.DeliveryConfigTemplate do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.notification.DeliveryConfigTemplate",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :webhook, 1, type: Flyteidl2.Notification.WebhookDeliveryTemplate
  field :email, 2, type: Flyteidl2.Notification.EmailDeliveryTemplate
end

defmodule Flyteidl2.Notification.RunCompletedNotificationTemplateData do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.notification.RunCompletedNotificationTemplateData",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :run, 1, type: Flyteidl2.Common.RunIdentifier, deprecated: false
  field :phase, 2, type: Flyteidl2.Common.ActionPhase, enum: true
  field :error, 3, type: :string
end

defmodule Flyteidl2.Notification.WebhookDeliveryTemplate.HeadersEntry do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.notification.WebhookDeliveryTemplate.HeadersEntry",
    map: true,
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :key, 1, type: :string
  field :value, 2, type: :string
end

defmodule Flyteidl2.Notification.WebhookDeliveryTemplate do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.notification.WebhookDeliveryTemplate",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :url, 1, type: :string, deprecated: false
  field :method, 2, type: Flyteidl2.Notification.HttpMethod, enum: true, deprecated: false

  field :headers, 3,
    repeated: true,
    type: Flyteidl2.Notification.WebhookDeliveryTemplate.HeadersEntry,
    map: true,
    deprecated: false

  field :body_template, 4, type: :string, json_name: "bodyTemplate"
end

defmodule Flyteidl2.Notification.EmailRecipient do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.notification.EmailRecipient",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :name, 1, type: :string
  field :address, 2, type: :string
end

defmodule Flyteidl2.Notification.EmailDeliveryTemplate do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.notification.EmailDeliveryTemplate",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :subject, 1, type: :string, deprecated: false
  field :to, 2, repeated: true, type: Flyteidl2.Notification.EmailRecipient, deprecated: false
  field :cc, 3, repeated: true, type: Flyteidl2.Notification.EmailRecipient
  field :bcc, 4, repeated: true, type: Flyteidl2.Notification.EmailRecipient
  field :html_template, 5, type: :string, json_name: "htmlTemplate", deprecated: false
  field :text_template, 6, type: :string, json_name: "textTemplate"
end
