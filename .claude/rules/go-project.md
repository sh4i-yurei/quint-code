---
paths:
  - "**/*.go"
---

# quint-code Go Conventions

Beyond the generic Go rules in ~/.claude/rules/go.md:

- MCP server: JSON-RPC 2.0 over stdio, follow MCP spec for tool
  registration
- FPF state machine: IDLE → ABDUCTION → DEDUCTION → INDUCTION
  → DECISION → IDLE. Phase transitions have preconditions — never
  skip phases. Each phase has a dedicated persona (Abductor,
  Verifier, Validator, Auditor).
- Holon serialization: YAML files in `.quint/` directories
  (`L0/`, `L1/`, `L2/`, `invalid/`, `drr/`)
- R_eff calculation: WLNK (weakest link) — `min(evidence_scores)`,
  never average
- Congruence levels: CL3 (same context), CL2 (similar), CL1 (different)
- Build with Taskfile: `task build`, `task test`, `task lint`
- Test FPF workflows end-to-end with temp .quint/ directories
