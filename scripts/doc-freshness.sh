#!/usr/bin/env bash
# doc-freshness — warn if Go source changed but diagrams didn't
# Used as a pre-commit hook. Always exits 0 (warn, never block).

GO_CHANGED=$(git diff --cached --name-only -- "*.go" | head -1)
if [ -n "$GO_CHANGED" ] && [ -d "docs/diagrams" ]; then
  SVG_CHANGED=$(git diff --cached --name-only -- "docs/diagrams/*.svg" | head -1)
  if [ -z "$SVG_CHANGED" ]; then
    echo "Warning - Go source changed but docs/diagrams/ not updated."
    echo "  Run /update-documentation or let scribe.sh handle it."
  fi
fi
exit 0
