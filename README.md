<div align="center">

# Infrastructure

Local development environment

[![CI](https://github.com/dz-market/infra/actions/workflows/ci.yml/badge.svg)](https://github.com/dz-market/infra/actions/workflows/ci.yml)
[![License](https://img.shields.io/github/license/dz-market/infra)](LICENSE)

</div>

## Run

Required Docker Compose, Task and curl. Clone the service repositories alongside this repository.

Start the environment:

```bash
task up
```

To start selected service profiles:

```bash
task up -- auth
```