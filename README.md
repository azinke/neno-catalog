# Neno model Catalog

An installable [Neno](https://github.com/azinke/neno) Catalog of portable model
resources for the public OpenAI Responses and Anthropic Messages APIs. Neno
validates each resource and derives its model descriptor and adapter digest
locally. Installing this Catalog does not contact either model provider.

## Models

| Neno model ID | Provider model | Parameters | Credential slot |
| --- | --- | --- | --- |
| `openai/default` | `gpt-6-luna` | reasoning `none` | `openai` |
| `openai/sprinter` | `gpt-6-luna` | reasoning `low` | `openai` |
| `openai/allrounder` | `gpt-6-luna` | reasoning `medium` | `openai` |
| `openai/thinker` | `gpt-6-luna` | reasoning `high` | `openai` |
| `anthropic/default` | `claude-haiku-4-5-20251001` | provider default sampling | `anthropic` |
| `anthropic/sprinter` | `claude-haiku-4-5-20251001` | temperature `0` | `anthropic` |
| `anthropic/allrounder` | `claude-haiku-4-5-20251001` | temperature `0.5` | `anthropic` |
| `anthropic/thinker` | `claude-haiku-4-5-20251001` | temperature `1` | `anthropic` |

`catalog.yml` contains references to the resources under `models/`. Each
resource selects an adapter built into Neno and declares its endpoint,
authentication requirement, parameters, limits, accounting revision, and
capabilities. It contains no API key, local keyring name, or execution authority.

## Install

You need a Neno revision that supports `neno/model/v1` resources and the
`git-catalog-1` acquisition format. Git must be available on `PATH`. Neno's
default protected keyring backend is currently Linux-only; other platforms need
a host-supplied backend.

Store a credential for each provider you intend to use. Neno reads the value at
a hidden prompt, keeping it out of shell history and command-line arguments:

```sh
neno config set --secret credentials.openai
neno config set --secret credentials.anthropic
```

Credentials are optional at installation time. Missing bindings remain visible
as `credential-missing` in model inventory.

Install the Catalog from a reviewed, full commit ID:

```sh
neno catalog install --name neno-models --format git-catalog-1 \
  --commit FULL_COMMIT_ID --entry catalog.yml \
  https://github.com/azinke/neno-catalog.git
neno model list
```

Alternatively, replace `--commit FULL_COMMIT_ID` with a complete published ref,
for example `--ref refs/tags/v1.2.0`. Add `--strict-credentials` if installation
must fail atomically when either required credential is unavailable.

Installed models initially use Neno's `prompt` access policy. After reviewing
the installed inventory, you can record a narrower model decision for a project:

```sh
neno model list
neno model get openai/default
neno model access set --project /path/to/project allow openai/default
```

Use `prompt` instead of `allow` to retain an execution-time decision, or `deny`
to block a model. These policy commands do not retrieve a key or contact a
provider. `neno model test MODEL_ID` is different: it performs a live,
potentially billable provider request.

## Update or uninstall

Always review an update proposal before applying it:

```sh
neno catalog update --dry-run neno-models
neno catalog update neno-models
```

To remove this installation:

```sh
neno catalog uninstall neno-models
```

Uninstalling preserves shared model records, credential mappings, and protected
credentials. Descriptor changes introduced by an update can invalidate existing
project pins or Agent Locks; review readiness before the next run.

## Maintain this Catalog

The checker supplied by Neno verifies the Catalog and every referenced model
resource without contacting a provider. With Neno and this repository checked
out beside each other, run:

```sh
make validate
```

For another checkout location, set `NENO_SOURCE`:

```sh
make validate NENO_SOURCE=/path/to/neno
```

When changing a model:

1. Edit its portable resource under `models/`.
2. Update `catalog.yml` only when adding, removing, or relocating a resource.
3. Bump `metadata.version` in `catalog.yml`.
4. Run `make validate` against the intended Neno revision.
5. Review and publish an immutable commit or tag.

Neno derives descriptors and `adapter-digest` values; neither is authored in
this repository. Never add API keys, keyring generations, local keyring names,
or project authority to a resource.

For the full format and distribution rules, see Neno's
[Catalog authoring guide](https://github.com/azinke/neno/blob/main/docs/creating-catalogs.md)
and [Catalog source guide](https://github.com/azinke/neno/blob/main/docs/catalog-sources.md).

## Layout

```text
.
├── catalog.yml
└── models
    ├── anthropic
    │   ├── allrounder.yaml
    │   ├── default.yaml
    │   ├── sprinter.yaml
    │   └── thinker.yaml
    └── openai
        ├── allrounder.yaml
        ├── default.yaml
        ├── sprinter.yaml
        └── thinker.yaml
```
