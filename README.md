<div align="center">

# Infrastructure

Local development environment

[![CI](https://github.com/dz-market/infra/actions/workflows/ci.yml/badge.svg)](https://github.com/dz-market/infra/actions/workflows/ci.yml)
[![License](https://img.shields.io/github/license/dz-market/infra)](LICENSE)

</div>

## Getting started

Requires Docker Compose and Task.

```bash
cp .env.example .env
```

### Run everything

```bash
task up
```

### Local development

Start dependencies and migrations, then run applications locally:

```bash
task up -- --deps auth user
```

Set `ENVOY_AUTH_HOST` and `ENVOY_USER_HOST` to `host.docker.internal` in `.env`.

To run only auth locally:

```bash
task up -- --exclude auth
```

Set in `.env`:

```dotenv
ENVOY_AUTH_HOST=host.docker.internal
AUTH_SERVICE_ADDR=host.docker.internal:50051
```

### Manage

```bash
task ps             # Container status
task logs -- vault  # Follow service logs
task stop           # Stop containers
task down           # Remove containers, keep data
task nuke           # Remove containers and all data
```