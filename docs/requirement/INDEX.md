---
last_updated: 2025-01-01
---

# Requirement Tracking Index

This file maps requirements to features for traceability.

## Format

| ID | Description | Status | Feature | Notes |
|----|-------------|--------|---------|-------|
| REQ-001 | Example requirement | TODO | - | From initial planning |

---

## How to use

### Adding requirements

1. Create folder: `docs/requirement/YYYY-MM-DD-meeting-name/`
2. Add `requirements.md` with detailed requirements
3. Add entries to the table above with unique IDs
4. Link to Features as they're created

### Linking to Features

When creating a Feature that implements requirements:
1. Add `refs: [REQ-001, REQ-002]` to Feature README frontmatter
2. Update this table's Feature column
3. Update Status when complete

### Status values

- **TODO**: Not started
- **IN_PROGRESS**: Being implemented
- **DONE**: Completed and verified
- **DEFERRED**: Postponed
- **CANCELLED**: No longer needed
