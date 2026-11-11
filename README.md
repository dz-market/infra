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

Run infrastructure and migrations, then manually start application:

```bash
task up -- --deps auth user
```

Or keep only `svc-auth` outside Docker:

```bash
task up -- --exclude auth
```

When auth runs on the host, set `AUTH_SERVICE_ADDR=host.docker.internal:50051` in `.env`.

### Manage

```bash
task ps             # Container status
task logs -- vault  # Follow service logs
task stop           # Stop containers
task down           # Remove containers, keep data
task nuke           # Remove containers and all data
```