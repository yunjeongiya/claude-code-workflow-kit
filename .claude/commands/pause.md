---
description: Save current work state with WIP commit
tags: [workflow, features]
---

**Save current work state** and create a WIP commit.

## Process

Use the Task tool with `general-purpose` subagent:

```
Work pause handling

Please perform the following tasks:

## 1. Check current session work
- TodoWrite contents
- git status for changed files
- Main changes from conversation context

## 2. Pre-commit validation
Warn user and recommend completing work first if:

- **Compile/build errors**: Build fails
- **Incomplete implementation**: Only partial code (e.g., Controller without Service)
- **Test failures**: Existing tests broken
- **Many debug logs**: 5+ console.log or commented code blocks
- **Conflict markers**: Git merge conflict markers remain

Warning example:
```
Warning: Not ready for commit:
- [Problem description]

Recommendation:
- [How to fix] then run /pause again

Proceed with current state anyway?
```

## 3. Check/Create Feature
- Search for related Feature in INDEX.md
- If not found, ask user about creating one

## 4. Update Feature file + work log
- Update Feature file's `updated` timestamp
- Update "In progress" checklist
- Update daily_work_summary/YYYY-MM-DD.md

## 5. Git commit (if validation passes)
- Add only files modified in this session
- Commit message: "wip: [work summary]"

## 6. Report results
```
Work state saved.

Completed in this session:
- [Work summary]

Modified files:
- [File list]

Git commit:
- [commit hash] wip: [commit message]

You can continue this work next time, or start something new.
```
```

## Output example

```
Paused (16:30 KST)

In progress:
- Improving pause/finish/blog commands

Changed files: 3
- .claude/commands/pause.md
- .claude/commands/finish.md
- docs/daily_work_summary/2025-11-17.md

Git commit:
- abc1234 wip: workflow command improvements

Use /resume to continue this work later.
```

## Important notes
- **Only summarize work from THIS session** (not all IN_PROGRESS features)
- **Only git add files modified in THIS session** (never use `git add -A` or `git commit -a`)
- All times in local timezone
- Commit messages use "wip:" prefix (indicates work-in-progress)
