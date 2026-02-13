---
description: Resume paused work (features system)
tags: [workflow, features]
---

**Resume paused work** by reading Features INDEX.md.

## Process

Use the Task tool with `general-purpose` subagent:

```
Resume paused work

Please perform the following tasks:

## 1. Read Features INDEX.md
- Find docs/features/INDEX.md
- List all IN_PROGRESS features

## 2. Present options to user
If multiple IN_PROGRESS features exist:
- Show list with brief descriptions
- Ask which one to resume

If only one IN_PROGRESS feature:
- Confirm with user

If no IN_PROGRESS features:
- Report none and suggest starting new work

## 3. Load Feature context
For selected Feature:
- Read Feature README.md fully
- Check "In progress" checklist
- Review recent changes

## 4. Report resume status
```
Resuming: [Feature name]

Progress:
- [X] Completed items
- [ ] Remaining items

Last update: [timestamp]
Last changes: [summary]

Ready to continue. What would you like to work on?
```
```

## Output example

```
Resuming: F123-curriculum-based-study-planner

Progress:
- [X] Backend API implementation
- [X] Frontend component structure
- [ ] AI recommendation system
- [ ] Testing

Last update: 2025-01-17 15:30 KST
Last changes: Added curriculum selection UI

Ready to continue. What would you like to work on?
```

## Important notes
- Only reads IN_PROGRESS features from INDEX.md
- Provides full context from Feature README.md
- User confirms which feature to resume
