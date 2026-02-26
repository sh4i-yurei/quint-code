# CodeRabbit Standards — quint-code

Mechanically-checkable rules for AI code review. These supplement
`path_instructions` in `.coderabbit.yaml`.

## FPF State Machine

1. Phase transitions MUST follow IDLE -> ABDUCTION -> DEDUCTION ->
   INDUCTION -> DECISION -> IDLE. No phase may be skipped.
2. Assurance score (R_eff) MUST use `min()` for weakest-link
   calculation. Never use average, sum, or any other aggregation.

## Go Conventions

1. All errors returned up the call stack MUST be wrapped with
   `fmt.Errorf("context: %w", err)`. Bare `errors.New` is only for
   sentinel errors at package level.
2. No swallowed errors — `_` assignments on error returns are not
   permitted. Every error must be returned, logged, or explicitly
   handled with documented justification.
3. Functions SHOULD be under 25 lines. Flag functions exceeding this.
4. Max 2 levels of control flow nesting. Flag deeper nesting.

## MCP Protocol

1. JSON-RPC 2.0 responses MUST include `id` and either `result` or
   `error`. Never both `result` and `error` in the same response.

## Testing

1. FSM transition tests MUST use table-driven format. Flag transition
   tests that are not table-driven.

## General

1. Conventional commits: `type(scope): summary`, lowercase summary,
   no trailing period, imperative mood.
2. Go version MUST be 1.24 or higher in CI workflows and go.mod.
