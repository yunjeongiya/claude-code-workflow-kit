# CLAUDE.md

This file provides guidance to Claude Code when working with code in this repository.

## Workflow System

This project uses a feature-based workflow tracking system.

### Commands Available

- `/pause` - Save work state with WIP commit
- `/resume` - Resume paused work from INDEX.md
- `/finish` - Complete feature, final commit
- `/snapshot` - Quick save without status change
- `/blog` - Draft blog post about recent work

### Feature Tracking

**All work must be tracked via Features.**

Location: `docs/features/`

**Before starting work:**
1. Check `docs/features/INDEX.md`
2. Find existing feature or create new one
3. Read `next_feature_id` before creating

**Creating new feature:**
1. Read `next_feature_id` from INDEX.md (e.g., F003)
2. Create folder: `docs/features/F003-feature-name/`
3. Create `README.md` with frontmatter
4. Update `next_feature_id` to F004
5. Add entry to INDEX.md

### Requirement Tracking

Location: `docs/requirement/`

- Link features to requirements via `refs:` in frontmatter
- Update `docs/requirement/INDEX.md` when completing features

## Git Rules

### Commit Safety

**Never use:**
- `git commit -a` (includes unintended files)
- `git add -A` (stages everything)
- `git add .` (same problem)

**Always use:**
```bash
git add file1.ts file2.tsx
git commit -m "type: description"
```

### Commit Message Format

```
type: brief description

Co-Authored-By: Claude <noreply@anthropic.com>
```

Types: `feat`, `fix`, `refactor`, `docs`, `test`, `chore`, `style`

## Code Quality

### Before Completing Work

- [ ] Remove debug logs (console.log, print statements)
- [ ] Remove commented-out code
- [ ] Run tests if applicable
- [ ] Update documentation if needed

### Naming Conventions

(Add your project's naming conventions here)

## Project Structure

```
.
├── .claude/
│   ├── commands/          # Slash commands
│   ├── hooks/             # Automation hooks
│   └── settings.local.json
├── docs/
│   ├── features/          # Feature tracking
│   ├── requirement/       # Requirement tracking
│   └── daily_work_summary/
└── src/                   # Your source code
```

## Notes

(Add project-specific notes here)
