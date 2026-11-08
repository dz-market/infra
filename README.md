<div align="center">

# Infrastructure

Local development environment

[![CI](https://github.com/dz-market/infra/actions/workflows/ci.yml/badge.svg)](https://github.com/dz-market/infra/actions/workflows/ci.yml)
[![License](https://img.shields.io/github/license/dz-market/infra)](LICENSE)

</div>

## Local Development

Requires Docker Compose and Task.

```bash
task up                        # Start everything
task up -- auth user           # Start selected applications
task up -- --deps auth user    # Start infrastructure and migrations
task up -- --exclude auth      # Keep auth out of Docker
task vault:credentials -- auth # Issue credentials for local auth
```