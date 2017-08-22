GOPATH_BIN     := $(GOPATH)/bin
PROTOC         := $(GOPATH_BIN)/protoc
PROTOC_PLUGIN  := $(GOPATH_BIN)/protoc-gen-gogoroach
GO      			 ?= go

all: ping.pb.go
	$(GO) version
	GOOS=${GOOS} GOARCH=${GOARCH} $(GO) build -v -i .

.PHONY: ping.pb.go
ping.pb.go:
	$(PROTOC) --plugin=$(PROTOC_PLUGIN) --gogoroach_out=plugins=grpc,import_prefix=:. ping.proto
