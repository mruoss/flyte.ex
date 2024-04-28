.DEFAULT_GOAL := all


SOURCES = $(wildcard src/flyteidl/protos/flyteidl/*/*.proto) $(wildcard src/flyteidl/protos/flyteidl/*/*/*.proto)

flyteidl_src := $(patsubst src/flyteidl/protos/flyteidl/%.proto,lib/flyte/%.pb.ex,${SOURCES})

.PHONY: init
init: 
	REF=$$(cd src/flyteidl && git describe --tags `git rev-list --tags --max-count=1`); \
	(cd src/flyteidl && git checkout $${REF})

.PHONY: all
all: ${flyteidl_src} 

lib/flyte/%.pb.ex: src/flyteidl/protos/flyteidl/%.proto
	ERL_AFLAGS='-kernel standard_io_encoding latin1' protoc --proto_path=./src/flyteidl/protos --proto_path=./src/googleapis --elixir_out=plugins=grpc:./lib $<
