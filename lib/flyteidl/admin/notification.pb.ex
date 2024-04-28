defmodule Flyteidl.Admin.EmailMessage do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :recipients_email, 1, repeated: true, type: :string, json_name: "recipientsEmail"
  field :sender_email, 2, type: :string, json_name: "senderEmail"
  field :subject_line, 3, type: :string, json_name: "subjectLine"
  field :body, 4, type: :string
end