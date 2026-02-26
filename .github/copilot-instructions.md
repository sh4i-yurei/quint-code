# Copilot Instructions for quint-code

## Repository purpose

quint-code is a Go MCP server implementing the First Principles Framework
(FPF) — a structured decision-tracking system using the ADI cycle
(Abduction → Deduction → Induction → Decision). It exposes tools via
JSON-RPC 2.0 over stdio.

## Repository structure

```text
src/mcp/
├── cmd/          # CLI entry point and command definitions
├── db/           # SQLite database and migrations
├── internal/fpf/ # Core FPF engine (server, FSM, tools)
├── go.mod
└── main.go
docs/             # Architecture docs, FPF engine reference
scripts/          # Development scripts
Taskfile.yaml     # Build system (task build/test/lint)
```

## Review priorities

When reviewing PRs, check in this order:

1. **FPF state machine correctness** — Phase transitions must follow
   IDLE → ABDUCTION → DEDUCTION → INDUCTION → DECISION → IDLE.
   Skipping phases must be blocked. Check `fsm.go` for violations.
2. **MCP protocol compliance** — JSON-RPC 2.0 spec adherence. Tool
   registration must match the MCP schema. Response format must be valid.
3. **Error handling** — Go error values must be returned explicitly.
   Never swallow errors. Wrap with `fmt.Errorf("context: %w", err)`.
4. **WLNK calculation** — R_eff = min(evidence_scores), never average.
   Any code computing assurance must use weakest-link semantics.
5. **Test coverage** — Table-driven tests for FSM transitions. Test
   public interfaces, not internal implementation.

## Code conventions

- Go 1.24+ required
- Functional core (pure functions) / imperative shell (I/O)
- Functions < 25 lines, max 2 levels of nesting
- Comments explain WHY, not WHAT
- Build: `task build`, `task test`, `task lint`

## What NOT to flag

- Missing godoc on unexported functions
- Line length in table-driven test data
- Import grouping style (goimports handles this)

## Commit conventions

- Conventional commits: `type(scope): summary`
- Types: feat, fix, docs, chore, refactor, test, ci
