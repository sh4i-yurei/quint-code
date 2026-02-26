# Decision Readiness Records (DRRs)

DRRs are quint-code's equivalent of Architecture Decision Records (ADRs).
They live in `.quint/drr/` within each project that uses quint-code.

## What is a DRR?

A DRR captures a decision that went through the FPF reasoning cycle:

1. **Abduction** (`quint_propose`) — Generate hypotheses
2. **Deduction** (`quint_verify`) — Logical verification
3. **Induction** (`quint_test`) — Empirical validation
4. **Audit** (`quint_audit`) — Bias and trust check
5. **Decision** (`quint_decide`) — Finalize with evidence

Unlike traditional ADRs, DRRs include verification evidence and an
audit trail showing how the decision was validated.

## When to create a DRR

Use the decision gate in `~/.claude/rules/decision-and-memory.md`:

- Choosing between 2+ viable approaches → DRR
- Decision affects multiple files/modules → DRR
- Hard to reverse once implemented → DRR
- Simple bug fix or reversible in < 5 min → skip

## Location

DRRs are created automatically by `quint_decide` and stored at:

```
<project>/.quint/drr/<YYYY-MM-DD>_<slug>.md
```

Since `.quint/` is project-local state (not committed to git), DRRs
persist per-machine. For decisions that should be shared across the
team, copy the DRR to `docs/architecture/adr/` or a similar committed
location.

## Checking existing decisions

Before proposing new architecture, always check:

```bash
ls .quint/drr/ 2>/dev/null
```

Or use `quint_status` to see the current FPF state.
