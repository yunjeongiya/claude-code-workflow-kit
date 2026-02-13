# Claude Code Workflow Kit

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Claude Code](https://img.shields.io/badge/Claude%20Code-Compatible-blueviolet)](https://claude.ai/code)
[![Platform](https://img.shields.io/badge/Platform-Windows%20%7C%20macOS%20%7C%20Linux-lightgrey)](https://github.com/yunjeongiya/claude-code-workflow-kit)

> **A batteries-included workflow system for [Claude Code](https://claude.ai/code)**
>
> Track features, manage requirements, automate commits, and maintain project context across sessions.

<p align="center">
  <img src="docs/images/workflow-diagram.svg" alt="Workflow Diagram" width="800">
</p>

---

## The Problem

Claude Code is powerful, but out of the box:

| Problem | Impact |
|---------|--------|
| **Session amnesia** | Context lost between conversations |
| **No work tracking** | Can't track features or progress |
| **Manual commits** | Repetitive, error-prone |
| **No guardrails** | Easy to `git add -A` sensitive files |

## The Solution

```
┌─────────────────────────────────────────────────────────────┐
│                  Claude Code Workflow Kit                    │
├─────────────────────────────────────────────────────────────┤
│  📁 Feature Tracking    │  Track work with git-friendly docs │
│  🔄 Session Continuity  │  /pause → /resume across sessions  │
│  🛡️ Safety Hooks        │  Block dangerous git commands      │
│  📋 Requirement Links   │  Connect features to requirements  │
│  ✍️ Blog Generation     │  Draft posts from recent work      │
└─────────────────────────────────────────────────────────────┘
```

---

## Quick Start

### 1. Clone and copy

```bash
git clone https://github.com/yunjeongiya/claude-code-workflow-kit.git
cd claude-code-workflow-kit

# Copy to your project
cp -r .claude /path/to/your-project/
cp -r docs /path/to/your-project/
cp CLAUDE.md /path/to/your-project/
```

### 2. Configure hooks

<details>
<summary><b>macOS / Linux</b></summary>

```bash
cd your-project
cp .claude/settings.local.json.example .claude/settings.local.json
chmod +x .claude/hooks/*.sh
```
</details>

<details>
<summary><b>Windows (PowerShell)</b></summary>

```powershell
cd your-project
Copy-Item .claude/settings.local.windows.json.example .claude/settings.local.json
```
</details>

### 3. Start using

```bash
claude  # Start Claude Code in your project

> I want to add user authentication
# → Claude checks INDEX.md, creates F002-user-auth

> /pause
# → Saves state, creates WIP commit

# ... next day ...

> /resume
# → Loads context, continues where you left off

> /finish
# → Completes feature, final commit, updates docs
```

---

## Commands

| Command | Description | When to use |
|---------|-------------|-------------|
| `/pause` | Save state + WIP commit | Stopping mid-work |
| `/resume` | Load feature context | Continuing previous work |
| `/finish` | Complete + final commit | Feature is done |
| `/snapshot` | Quick save | During long sessions |
| `/blog` | Draft blog post | Share your work |

### Command Flow

```
Start work
    │
    ▼
┌─────────┐     ┌──────────┐     ┌─────────┐
│ /resume │ ──▶ │  Work    │ ──▶ │ /pause  │
└─────────┘     └──────────┘     └─────────┘
                     │                │
                     │                │
                     ▼                ▼
               ┌──────────┐    (next session)
               │ /finish  │
               └──────────┘
                     │
                     ▼
               ┌──────────┐
               │  /blog   │  (optional)
               └──────────┘
```

---

## Feature Tracking

All work is tracked via Features - git-friendly markdown files.

### Structure

```
docs/features/
├── INDEX.md                      # 🗂️ Quick lookup + next_feature_id
├── F001-example-feature/
│   └── README.md                 # 📄 Feature docs
├── F002-user-auth/
│   └── README.md
└── ...
```

### Lifecycle

```
         ┌──────────┐
         │   TODO   │
         └────┬─────┘
              │ start
              ▼
       ┌──────────────┐
       │ IN_PROGRESS  │◀─────┐
       └──────┬───────┘      │
              │              │ unblock
         ┌────┴────┐         │
         │         │         │
    done │         │ blocked │
         ▼         ▼         │
   ┌──────────┐  ┌─────────┐ │
   │   DONE   │  │ ON_HOLD ├─┘
   └──────────┘  └─────────┘
```

### Feature Frontmatter

```yaml
---
id: F002
title: User Authentication
status: IN_PROGRESS
priority: HIGH
created: 2025-01-15
started: 2025-01-15
refs: [REQ-001, REQ-002]  # Links to requirements
estimated_hours: 8
elapsed_hours: 3
---
```

---

## Safety Hooks

### Blocked Commands

The kit prevents dangerous git patterns:

| Blocked | Reason | Safe Alternative |
|---------|--------|------------------|
| `git commit -a` | Includes untracked files | `git add file1 file2 && git commit` |
| `git add -A` | Stages everything | `git add specific-file.ts` |
| `git add .` | Same as above | `git add src/component.tsx` |

### Hook System

```
┌──────────────────┐     ┌─────────────────────┐
│  User types      │     │  Hook fires         │
│  "git commit -a" │ ──▶ │  (PreToolUse)       │
└──────────────────┘     └──────────┬──────────┘
                                    │
                         ┌──────────▼──────────┐
                         │  git-commit-check   │
                         │  returns exit 2     │
                         └──────────┬──────────┘
                                    │
                         ┌──────────▼──────────┐
                         │  ❌ BLOCKED         │
                         │  "Use explicit      │
                         │   git add instead"  │
                         └─────────────────────┘
```

---

## Requirement Tracking

Link features to requirements for full traceability.

```
docs/requirement/
├── INDEX.md                        # Requirement → Feature mapping
├── 2025-01-15-kickoff/
│   └── requirements.md             # Meeting notes
└── ...
```

### Linking

```yaml
# In Feature README.md
refs: [REQ-001, REQ-002]

# In requirement/INDEX.md
| ID      | Description     | Status | Feature |
|---------|-----------------|--------|---------|
| REQ-001 | User can login  | DONE   | F002    |
| REQ-002 | JWT tokens      | DONE   | F002    |
```

---

## File Structure

```
your-project/
├── .claude/
│   ├── commands/
│   │   ├── pause.md          # 💾 Save work state
│   │   ├── resume.md         # 🔄 Resume work
│   │   ├── finish.md         # ✅ Complete feature
│   │   ├── snapshot.md       # 📸 Quick save
│   │   └── blog.md           # ✍️ Draft blog post
│   ├── hooks/
│   │   ├── feature-reminder.sh   # 📋 Track features
│   │   ├── feature-reminder.ps1  # (Windows)
│   │   ├── git-commit-check.sh   # 🛡️ Safe commits
│   │   └── git-commit-check.ps1  # (Windows)
│   └── settings.local.json       # ⚙️ Hook config
├── docs/
│   ├── features/             # 📁 Feature tracking
│   │   └── INDEX.md
│   ├── requirement/          # 📋 Requirements
│   │   └── INDEX.md
│   └── daily_work_summary/   # 📅 Daily logs
└── CLAUDE.md                 # 📖 Project instructions
```

---

## Customization

### Adding Custom Commands

Create `.claude/commands/deploy.md`:

```markdown
---
description: Deploy to production
---

# Deploy Command

1. Run tests
2. Build production bundle
3. Deploy to server
4. Update deployment log
```

Then use: `/deploy`

### Adding Custom Hooks

1. Create script: `.claude/hooks/lint-check.sh`
2. Add to `settings.local.json`:

```json
{
  "hooks": {
    "PreToolUse": [{
      "matcher": "Bash",
      "hooks": [{
        "type": "command",
        "command": "bash .claude/hooks/lint-check.sh",
        "timeout": 10
      }]
    }]
  }
}
```

---

## Best Practices

### ✅ Do

- Check `INDEX.md` before starting work
- Create feature first, then code
- Use `/pause` when stopping mid-work
- Link requirements with `refs:`

### ❌ Don't

- Skip feature creation
- Use `git commit -a` or `git add -A`
- Forget to `/finish` completed work
- Manually assign feature IDs

---

## Troubleshooting

<details>
<summary><b>Hooks not firing</b></summary>

1. Check permissions: `chmod +x .claude/hooks/*.sh`
2. Verify JSON syntax in `settings.local.json`
3. Check hook script for errors
</details>

<details>
<summary><b>Commands not recognized</b></summary>

1. Ensure `.claude/commands/` exists
2. Check frontmatter syntax
3. Restart Claude Code
</details>

<details>
<summary><b>Feature ID conflicts</b></summary>

1. Always read `next_feature_id` first
2. Increment immediately after creating
3. Never manually assign IDs
</details>

---

## Contributing

Contributions welcome!

1. Fork the repository
2. Create a feature branch
3. Submit a pull request

---

## License

MIT License - see [LICENSE](LICENSE)

---

<p align="center">
  <b>Built for production. Shared for everyone.</b><br>
  <i>Because your AI coding assistant should remember what you're working on.</i>
</p>

<p align="center">
  <a href="https://github.com/yunjeongiya/claude-code-workflow-kit/stargazers">⭐ Star this repo</a> if you find it useful!
</p>
