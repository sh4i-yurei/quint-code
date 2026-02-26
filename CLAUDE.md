# CLAUDE.md

This file provides guidance to Claude Code when working in this repository.

## What this project is

quint-code is a Go MCP server implementing the First Principles Framework
(FPF) — structured reasoning via the ADI cycle (Abduction → Deduction →
Induction → Decision). It runs as a stdio JSON-RPC 2.0 server and stores
state in `.quint/` directories within each project.

Source: `src/mcp/`. Binary installs to `~/.local/bin/quint-code`.

## Development commands

| Command | What it does |
|---------|-------------|
| `task build` | Build binary (`src/mcp/` → `~/.local/bin/quint-code`) |
| `task test` | Run all tests (`go test -v ./...`) |
| `task lint` | Run linter (`go vet ./...`) |
| `task --list` | Show all available tasks |

## Architecture

See `docs/architecture.md` for system design. Key constraint:
FPF state machine phases have preconditions — skipping phases is blocked.

Diagram freshness: !stat -c '%Y' docs/diagrams/deps-internal.svg 2>/dev/null || echo "no diagrams"

## FPF reference

Full ADI cycle, commands, glossary, and when-to-use guidance:
see `docs/fpf-engine.md`.

When-to-use decision gate: see `~/.claude/rules/decision-and-memory.md`.

## Decision records

Architecture and design decisions live in `.quint/drr/` within each
project. Check existing DRRs before proposing new architecture — these
are our ADR equivalent.

## MCP debugging

Inspect the server interactively:
```bash
npx @modelcontextprotocol/inspector ~/.local/bin/quint-code serve
```

## Project-specific reminders

- Check `.quint/knowledge/` for verified project claims before making assumptions
- Transformer Mandate: generate options with evidence, human decides — never make architectural choices autonomously
- `.quint/context.md` has project constraints and tech stack
