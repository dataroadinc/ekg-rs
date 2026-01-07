CARGO_BIN := cargo

#
# Install all the tools needed to run this project.
#
.PHONY: install
install:
	@echo "Install targets removed - use system package managers directly"

.PHONY: build-without-rdfox-dylib
build-without-rdfox-dylib:
	$(CARGO_BIN) build --release --no-default-features --workspace

.PHONY: build-with-rdfox-dylib
build-with-rdfox-dylib:
	$(CARGO_BIN) build --release --no-default-features --features rdfox-dylib,fs --workspace

.PHONY: build-all
build-all: build-without-rdfox-dylib build-with-rdfox-dylib

.PHONY: test-without-rdfox-dylib
test-without-rdfox-dylib:
	$(CARGO_BIN) test --release --no-default-features --workspace

.PHONY: test-with-rdfox-dylib
test-with-rdfox-dylib:
	$(CARGO_BIN) test --release --no-default-features --features rdfox-dylib,fs --workspace

.PHONY: test-all
test-all: test-without-rdfox-dylib test-with-rdfox-dylib

#
# Just build the workspace
#
.PHONY: build
build:
	$(CARGO_BIN) build --workspace

.PHONY: build-release
build-release:
	$(CARGO_BIN) build --release --workspace

#
# Format Cargo.toml files
#
.PHONY: fmt-toml
fmt-toml:
	cargo fmt-toml

.PHONY: check-fmt-toml
check-fmt-toml:
	cargo fmt-toml --check

#
# Propagate features across workspace
#
.PHONY: propagate-features
propagate-features:
	cargo propagate-features --features rdfox-7-0a,rdfox-7-2a,rdfox-dylib,rdfox-static,oxigraph-support

#
# Version management
#
.PHONY: version-current
version-current:
	cargo version-info current

.PHONY: version-next
version-next:
	cargo version-info next

.PHONY: version-latest
version-latest:
	cargo version-info latest

