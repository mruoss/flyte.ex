.DEFAULT_GOAL := all


SOURCES = $(wildcard src/flyte/flyteidl/protos/flyteidl/*/*.proto) $(wildcard src/flyte/flyteidl/protos/flyteidl/*/*/*.proto)

flyteidl_src := $(patsubst src/flyte/flyteidl/protos/flyteidl/%.proto,lib/flyte/%.pb.ex,${SOURCES})

.PHONY: init
init:
	REF=$$(cd src/flyte/flyteidl && git describe --tags `git rev-list --tags --max-count=1`); \
	(cd src/flyte/flyteidl && git checkout $${REF})

.PHONY: all
all: ${flyteidl_src}

lib/flyte/%.pb.ex: src/flyte/flyteidl/protos/flyteidl/%.proto
	ERL_AFLAGS='-kernel standard_io_encoding latin1' protoc --proto_path=./src/flyte/flyteidl/protos --proto_path=./src/grpc-gateway --proto_path=./src/googleapis --elixir_out=plugins=grpc:./lib $<
