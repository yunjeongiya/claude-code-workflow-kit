---
description: Save intermediate work state (with wip commit)
tags: [workflow, features]
---

**Save intermediate state** without changing Feature status.

## Process

Use the Task tool with `general-purpose` subagent:

```
Snapshot current work

Please perform the following tasks:

## 1. Check current session work
- TodoWrite contents
- git status for changed files
- Main changes from conversation context

## 2. Quick validation
Only check for critical issues:
- Conflict markers in files
- Obvious syntax errors

## 3. Update Feature file (if exists)
- Update `updated` timestamp
- Update progress notes

## 4. Git commit
- Add only files modified in this session
- Commit message: "wip: [brief summary]"

## 5. Brief report
```
Snapshot saved.

Changes:
- [file list]

Commit: [hash] wip: [message]

Continue working or take a break.
```
```

## Output example

```
Snapshot saved (14:30 KST)

Changes: 2 files
- src/components/Dialog.tsx
- src/hooks/useDialog.ts

Commit: def5678 wip: dialog component refactoring

Continue working or take a break.
```

## Important notes
- Lighter than /pause - no detailed report
- Does NOT change Feature status
- Good for saving progress during long sessions
- Use /pause when actually stopping work
