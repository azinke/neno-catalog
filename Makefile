NENO_SOURCE ?= ../neno
CATALOG_ENTRY ?= catalog.yml

.PHONY: validate

validate:
	@test -f "$(NENO_SOURCE)/go.mod" || { \
		echo "Neno source not found at $(NENO_SOURCE); set NENO_SOURCE=/path/to/neno" >&2; \
		exit 1; \
	}
	cd "$(NENO_SOURCE)" && go run ./examples/catalogs/check "$(CURDIR)" "$(CATALOG_ENTRY)"
