---
last_updated: 2025-01-01
next_feature_id: F002
auto_generated: true
---

# Feature Tracking Index

> This file is the source of truth for feature tracking.
> Individual feature files contain detailed documentation.

## Summary
- **TODO**: 0
- **IN_PROGRESS**: 1
- **DONE**: 0

---

## IN_PROGRESS

### [F001](F001-example-feature/README.md) Example Feature
- **Priority**: MEDIUM
- **Started**: 2025-01-01
- **refs**: -
- **Topic**: This is an example feature to demonstrate the tracking system

---

## TODO

(No items)

---

## DONE

(No items)

---

## How to use this system

### Creating a new feature

1. Check `next_feature_id` above (e.g., F002)
2. Create folder: `docs/features/F002-feature-name/`
3. Create `README.md` with frontmatter (see example)
4. Update `next_feature_id` to F003
5. Add entry to appropriate section above

### Feature lifecycle

```
TODO → IN_PROGRESS → DONE
           ↓
       ON_HOLD (if blocked)
```

### Commands

- `/pause` - Save work state, create WIP commit
- `/resume` - Resume IN_PROGRESS feature
- `/finish` - Mark feature DONE, create final commit
- `/snapshot` - Quick save without status change
- `/blog` - Draft blog post about recent work
