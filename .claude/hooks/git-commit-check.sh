#!/bin/bash
# PreToolUse hook: Prevent dangerous git commands
# Blocks: git commit -a, git add -A, git add .
# stdout → injected into Claude's context

# Read tool input from stdin (JSON format)
INPUT=$(cat)

# Check if this is a git commit with -a flag or git add with dangerous flags
COMMAND=$(echo "$INPUT" | grep -o '"command":"[^"]*"' | sed 's/"command":"//;s/"$//')

if echo "$COMMAND" | grep -qE "git commit.*-a|git add -A|git add \\."; then
  echo "BLOCKED: Dangerous git command detected."
  echo "- git commit -a: May include unintended files"
  echo "- git add -A or git add .: May stage sensitive files"
  echo ""
  echo "Instead, explicitly add specific files:"
  echo "  git add file1.ts file2.tsx && git commit -m 'message'"
  exit 2  # Block the tool
fi

exit 0  # Allow the tool
