---
description: Complete work process (cleanup, commit, documentation)
tags: [workflow, features]
---

**Complete work** and change Feature status to DONE.

## Process

Use the Task tool with `general-purpose` subagent:

```
Work completion handling

Please perform the following tasks:

## 1. Check current session work
- TodoWrite contents
- git status for changed files
- Main changes from conversation context

## 2. Additional validation

### 2.1 Server code changes: Test verification
- Check if related test code exists
- Run tests if applicable
- Report test pass/fail status
- Notify user if no tests exist

### 2.2 Code cleanup (debug log removal)
- Remove debugging logs (console.log, System.out.println, etc.)
- Remove commented test code or temporary code
- Keep intentional logs (console.error, logger.error, etc.)
- Report cleaned file list

## 3. Check/Create Feature
- Search for related Feature in INDEX.md
- If not found, ask user about creating one
- If found, change status to DONE

## 4. Update Feature file + work log
- Feature file:
  - `status: DONE`
  - `completed: [current time]`
  - `elapsed_hours: [calculated]`
  - Check all items in "Completed work" checklist
- Update daily_work_summary/YYYY-MM-DD.md
- Update INDEX.md (move to DONE section)

## 5. Promote learnings to CLAUDE.md (optional)
If work log has "key learnings" that can be generalized:
- Ask user about adding to CLAUDE.md
- Add to appropriate section if approved

## 6. Requirement INDEX.md review and update
- Check related requirement IDs from Feature README's `refs:` field
- Find those IDs in `docs/requirement/INDEX.md`
- Record current Feature number in Feature column
- Change status column to DONE
- Verify code changes match requirement details
- Report any missing or mismatched requirements

## 7. Git commit
- Add only files modified in this session
- Draft commit message and get user approval
- Format: `type: brief summary` (feat, fix, refactor, docs, test, chore, style)
- Execute commit and record hash

## 8. Record commit hash in Features file
- Update "Related commits" section in Feature README.md
- Reflect commit hash in INDEX.md

## 9. Final report
Output in this format:

```markdown
## Work Completion Report

### Modified files
- [repository]/[file path] - [change description]

### Main changes
1. [feature/bug] - [summary]

### Test results (for server changes)
- [Pass/Fail/N/A] Related tests completed

### Code cleanup
- [Done/Not done] Debug log removal complete

### Git commit
- [repository]: [commit hash] - [commit message]

### Documentation updates
- [Done] Features system updated
- [Done/Not done] requirement.md synced
- [Done] Work log updated

### Next steps
- [suggestions or "None"]

### Blog post suggestion
- If this work seems suitable for a blog post, you can draft one with the `/blog` command.
```
```

## Output example

```
Completed (18:00 KST)

Completed work:
- QA consultation page UI implementation

Test results:
- All related tests passed

Modified files: 5
- src/pages/Consultation.tsx
- docs/features/F062-consultation-page-ui/README.md
- docs/daily_work_summary/2025-11-17.md

Git commit:
- abc1234 feat: consultation page UI implementation

Use `/blog` command to write a blog post about this work.
```

## Important notes
- **All work is tracked via Features** (cannot /finish without a Feature)
- All times in local timezone
- Only commit files modified in this session
- Reflect submodule changes in main repository
