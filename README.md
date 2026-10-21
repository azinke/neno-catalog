# Neno model Catalog

An installable [Neno](https://github.com/azinke/neno) Catalog of portable model
resources for the public OpenAI Responses and Anthropic Messages APIs. Neno
validates each resource and derives its model descriptor and adapter digest
locally. Installing this Catalog does not contact either model provider.

## Models

Every model below provides `default`, `sprinter`, `allrounder`, and `thinker`
profiles. Append the profile to the Neno prefix: for example,
`openai/gpt-4-1/default`, `openai/gpt-5-6-sol/thinker`, or
`anthropic/opus-5-5/allrounder`.

Resources follow `models/<provider>/<model>/<profile>.yaml`, with matching
Neno IDs `<provider>/<model>/<profile>`. Dots in provider model names become
hyphens in catalog path segments. `spec.model` records the exact provider
identifier, including a dated snapshot where one is published. Distinct model
versions coexist without changing existing IDs.

### OpenAI

All OpenAI resources use the Responses API, strict JSON Schema output, function
calling, the `openai` credential slot, and `service_tier: default`.
Specifications and lifecycle dates were checked against the official OpenAI
documentation on 2026-10-21. Context and output ceilings are in tokens.

| Neno prefix | Provider model / official documentation | Context | Max output | Lifecycle |
| --- | --- | ---: | ---: | --- |
| `openai/luna` | [`gpt-6-luna`](https://developers.openai.com/api/docs/models/gpt-6-luna) | 1,050,000 | 128,000 | Current |
| `openai/astra` | [`gpt-6-astra`](https://developers.openai.com/api/docs/models/gpt-6-astra) | 1,050,000 | 128,000 | Current |
| `openai/sol` | [`gpt-6.1-sol`](https://developers.openai.com/api/docs/models/gpt-6.1-sol) | 1,050,000 | 128,000 | Current |
| `openai/gpt-4-1` | [`gpt-4.1-2025-04-14`](https://developers.openai.com/api/docs/models/gpt-4.1) | 1,047,576 | 32,768 | Deprecated; shuts down 2027-01-14 |
| `openai/gpt-4-1-mini` | [`gpt-4.1-mini-2025-04-14`](https://developers.openai.com/api/docs/models/gpt-4.1-mini) | 1,047,576 | 32,768 | Deprecated; shuts down 2027-01-14 |
| `openai/gpt-4o` | [`gpt-4o-2024-11-20`](https://developers.openai.com/api/docs/models/gpt-4o) | 128,000 | 16,384 | Deprecated; shuts down 2027-01-14 |
| `openai/gpt-4o-mini` | [`gpt-4o-mini-2024-07-18`](https://developers.openai.com/api/docs/models/gpt-4o-mini) | 128,000 | 16,384 | Deprecated; shuts down 2027-01-14 |
| `openai/gpt-5` | [`gpt-5-2025-08-07`](https://developers.openai.com/api/docs/models/gpt-5) | 400,000 | 128,000 | Deprecated; shuts down 2026-12-11 |
| `openai/gpt-5-mini` | [`gpt-5-mini-2025-08-07`](https://developers.openai.com/api/docs/models/gpt-5-mini) | 400,000 | 128,000 | Deprecated; shuts down 2026-12-11 |
| `openai/gpt-5-nano` | [`gpt-5-nano-2025-08-07`](https://developers.openai.com/api/docs/models/gpt-5-nano) | 400,000 | 128,000 | Deprecated; shuts down 2026-12-11 |
| `openai/gpt-5-2` | [`gpt-5.2-2025-12-11`](https://developers.openai.com/api/docs/models/gpt-5.2) | 400,000 | 128,000 | Available |
| `openai/gpt-5-4` | [`gpt-5.4-2026-03-05`](https://developers.openai.com/api/docs/models/gpt-5.4) | 1,050,000 | 128,000 | Available |
| `openai/gpt-5-4-mini` | [`gpt-5.4-mini-2026-03-17`](https://developers.openai.com/api/docs/models/gpt-5.4-mini) | 400,000 | 128,000 | Available |
| `openai/gpt-5-5` | [`gpt-5.5-2026-04-23`](https://developers.openai.com/api/docs/models/gpt-5.5) | 1,050,000 | 128,000 | Available |
| `openai/gpt-5-6-sol` | [`gpt-5.6-sol`](https://developers.openai.com/api/docs/models/gpt-5.6-sol) | 1,050,000 | 128,000 | Available |
| `openai/gpt-5-6-terra` | [`gpt-5.6-terra`](https://developers.openai.com/api/docs/models/gpt-5.6-terra) | 1,050,000 | 128,000 | Available |
| `openai/gpt-5-6-luna` | [`gpt-5.6-luna`](https://developers.openai.com/api/docs/models/gpt-5.6-luna) | 1,050,000 | 128,000 | Available |

`sol` selects GPT-6.1 Sol. GPT-5.6 Sol has the separate prefix
`openai/gpt-5-6-sol`.

GPT-4.1, GPT-4o, and their mini variants remain callable until **2027-01-14**.
The original GPT-5, GPT-5 Mini, and GPT-5 Nano snapshots remain callable until
**2026-12-11**. These are deprecated compatibility options; use the lifecycle
column when selecting a model. Original GPT-4, GPT-4 Turbo, and GPT-4.1 Nano
are omitted because their shutdown is **2026-10-23**. See the official
[OpenAI deprecation schedule](https://developers.openai.com/api/docs/deprecations).

### Anthropic

The catalog includes all generally available Claude models marked **Active**
in the [Anthropic lifecycle table](https://platform.claude.com/docs/en/about-claude/model-deprecations)
as of 2026-10-21, including active legacy versions. The current lineup is
Fable 5.1, Opus 5.5, Sonnet 5.5, and Haiku 5.5. The Mythos models require
separate program approval and are not included.

All Anthropic resources use the Messages API, JSON Schema output, function
calling, the `anthropic` credential slot, and `service_tier: standard_only`.
Context and output ceilings below are for the regular Messages API; the
larger beta Batch output ceilings are not used.

| Neno prefix | Provider model / official documentation | Context | Max output | Lifecycle |
| --- | --- | ---: | ---: | --- |
| `anthropic/fable-5-1` | [`claude-fable-5-1`](https://platform.claude.com/docs/en/models/fable-5-1/overview) | 1,000,000 | 128,000 | Latest |
| `anthropic/fable-5` | [`claude-fable-5`](https://platform.claude.com/docs/en/models/fable-5/overview) | 1,000,000 | 128,000 | Active legacy |
| `anthropic/opus-5-5` | [`claude-opus-5-5`](https://platform.claude.com/docs/en/models/opus-5-5/overview) | 1,000,000 | 128,000 | Latest |
| `anthropic/opus-5` | [`claude-opus-5`](https://platform.claude.com/docs/en/models/opus-5/overview) | 1,000,000 | 128,000 | Active legacy |
| `anthropic/opus-4-8` | [`claude-opus-4-8`](https://platform.claude.com/docs/en/models/opus-4-8/overview) | 1,000,000 | 128,000 | Active legacy |
| `anthropic/opus-4-7` | [`claude-opus-4-7`](https://platform.claude.com/docs/zh-TW/models/opus-4-7/overview) | 1,000,000 | 128,000 | Active legacy |
| `anthropic/opus-4-6` | [`claude-opus-4-6`](https://platform.claude.com/docs/en/models/opus-4-6/overview) | 1,000,000 | 128,000 | Active legacy |
| `anthropic/opus-4-5` | [`claude-opus-4-5-20251101`](https://platform.claude.com/docs/en/models/opus-4-5/overview) | 200,000 | 64,000 | Active legacy |
| `anthropic/sonnet-5-5` | [`claude-sonnet-5-5`](https://platform.claude.com/docs/en/models/sonnet-5-5/overview) | 1,000,000 | 128,000 | Latest |
| `anthropic/sonnet-5` | [`claude-sonnet-5`](https://platform.claude.com/docs/en/models/sonnet-5/overview) | 1,000,000 | 128,000 | Active legacy |
| `anthropic/sonnet-4-6` | [`claude-sonnet-4-6`](https://platform.claude.com/docs/en/models/sonnet-4-6/overview) | 1,000,000 | 128,000 | Active legacy |
| `anthropic/haiku-5-5` | [`claude-haiku-5-5`](https://platform.claude.com/docs/en/models/haiku-5-5/overview) | 1,000,000 | 128,000 | Latest |
| `anthropic/haiku` | [`claude-haiku-4-5-20251001`](https://platform.claude.com/docs/en/models/haiku-4-5/overview) | 200,000 | 64,000 | Active legacy |

The existing `anthropic/haiku` profiles continue to select Haiku 4.5. Use
`anthropic/haiku-5-5/<profile>` for Haiku 5.5.

### Profile settings

| Model group | `default` | `sprinter` | `allrounder` | `thinker` |
| --- | --- | --- | --- | --- |
| GPT-5 variants, Astra, Sol | Provider default reasoning | Reasoning `low` | Reasoning `medium` | Reasoning `high` |
| Luna | Reasoning `none` | Reasoning `low` | Reasoning `medium` | Reasoning `high` |
| GPT-4.1, GPT-4o, their mini variants | Provider default sampling | Temperature `0` | Temperature `0.5` | Temperature `1` |
| New Claude resources | Provider default effort | Effort `low` | Effort `medium` | Effort `high` |
| Existing Haiku 4.5 | Provider default sampling | Temperature `0` | Temperature `0.5` | Temperature `1` |

GPT-4 resources declare `reasoning: false` and send no reasoning parameter.
Their profile names describe sampling presets; `thinker` does not enable
reasoning, and `sprinter` does not promise lower latency. The original GPT-5
variants never send the unsupported `none` effort.

New Claude resources explicitly enable adaptive thinking, except Opus 4.5,
which uses the effort parameter without enabling extended thinking. Effort
controls overall generation as well as thinking; it is not a fixed thinking
token budget. Adaptive profiles omit sampling parameters and declare
`sampling: false`. See Anthropic's
[effort documentation](https://platform.claude.com/docs/en/build-with-claude/effort)
and [structured output support](https://platform.claude.com/docs/en/build-with-claude/structured-outputs).

`catalog.yml` contains references to the resources under `models/`. Each
resource selects an adapter built into Neno and declares its endpoint,
authentication requirement, parameters, limits, accounting revision, and
capabilities. It contains no API key, local keyring name, or execution authority.
The local checker validates resources and derives descriptors; it does not
verify account access or execute a provider request.

## Install

You need a Neno revision that supports `neno/model/v1` resources, three-segment
model IDs, and the `git-catalog-1` acquisition format. Git must be available on
`PATH`. Neno's default protected keyring backend is currently Linux-only; other
platforms need a host-supplied backend.

The new Claude profiles also require adapter support for the `thinking` and
`effort` parameters. Validate with the Neno revision you intend to deploy.

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
neno model get openai/luna/default
neno model access set --project /path/to/project allow openai/luna/default
```

Use `prompt` instead of `allow` to retain an execution-time decision, or `deny`
to block a model. These policy commands do not retrieve a key or contact a
provider. `neno model test MODEL_ID` is different: it performs a live,
potentially billable provider request.

## Update or uninstall

When migrating from the earlier provider-only IDs, change `openai/<profile>`
to `openai/luna/<profile>` and `anthropic/<profile>` to
`anthropic/haiku/<profile>`. Update model references and project access decisions,
then refresh affected project pins and Agent Locks.

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

1. Edit its portable resource under `models/<provider>/<model>/`, keeping its
   `metadata.id` aligned with `<provider>/<model>/<profile>`.
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
