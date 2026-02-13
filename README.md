# Claude Code Workflow Kit

A batteries-included workflow system for [Claude Code](https://claude.ai/code) - Anthropic's official AI coding assistant CLI.

**Track features, manage requirements, automate commits, and maintain project context across sessions.**

## Why This Kit?

Claude Code is powerful, but out of the box it lacks:
- **Session continuity** - Context is lost between conversations
- **Work tracking** - No built-in way to track features or progress
- **Workflow automation** - Repetitive tasks like commits need manual handling
- **Safety guardrails** - Easy to accidentally commit sensitive files

This kit solves all of these with:
- **Feature tracking system** - Git-friendly feature documentation with status tracking
- **Slash commands** - `/pause`, `/resume`, `/finish` for workflow automation
- **Hooks** - Prevent dangerous git commands, remind about feature tracking
- **Requirement linking** - Connect features to requirements for traceability

## Quick Start

### 1. Copy to your project

```bash
# Clone this repo
git clone https://github.com/YOUR_USERNAME/claude-code-workflow-kit.git

# Copy to your project
cp -r claude-code-workflow-kit/.claude your-project/
cp -r claude-code-workflow-kit/docs your-project/
cp claude-code-workflow-kit/CLAUDE.md your-project/
```

### 2. Configure hooks

**macOS/Linux:**
```bash
cp .claude/settings.local.json.example .claude/settings.local.json
chmod +x .claude/hooks/*.sh
```

**Windows:**
```powershell
Copy-Item .claude/settings.local.windows.json.example .claude/settings.local.json
```

### 3. Start using

```bash
# In your project directory
claude

# Start working on a feature
> I want to add user authentication

# Claude will check INDEX.md and create a new feature

# When done for now
> /pause

# Next session
> /resume

# When feature is complete
> /finish
```

## Features

### Slash Commands

| Command | Description |
|---------|-------------|
| `/pause` | Save work state with WIP commit, update feature tracking |
| `/resume` | Resume paused work, load feature context |
| `/finish` | Complete feature, cleanup code, final commit |
| `/snapshot` | Quick save without changing feature status |
| `/blog` | Draft a blog post about recent work |

### Hooks

| Hook | Trigger | Purpose |
|------|---------|---------|
| `feature-reminder` | UserPromptSubmit | Reminds to track features |
| `git-commit-check` | PreToolUse (Bash) | Blocks dangerous git commands |

**Blocked git commands:**
- `git commit -a` - May include unintended files
- `git add -A` - May stage sensitive files
- `git add .` - Same as above

### Feature Tracking System

```
docs/features/
├── INDEX.md                    # Quick lookup, next_feature_id
├── F001-user-auth/
│   └── README.md               # Feature documentation
├── F002-api-rate-limiting/
│   └── README.md
└── ...
```

**Feature lifecycle:**
```
TODO → IN_PROGRESS → DONE
           ↓
       ON_HOLD (if blocked)
```

**Feature README frontmatter:**
```yaml
---
id: F001
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

### Requirement Tracking

```
docs/requirement/
├── INDEX.md                    # Requirement → Feature mapping
├── 2025-01-15-kickoff/
│   └── requirements.md         # Meeting requirements
└── ...
```

Link requirements to features with `refs:` in feature frontmatter.

## File Structure

```
your-project/
├── .claude/
│   ├── commands/
│   │   ├── pause.md           # /pause command
│   │   ├── resume.md          # /resume command
│   │   ├── finish.md          # /finish command
│   │   ├── snapshot.md        # /snapshot command
│   │   └── blog.md            # /blog command
│   ├── hooks/
│   │   ├── feature-reminder.sh    # (or .ps1 for Windows)
│   │   └── git-commit-check.sh    # (or .ps1 for Windows)
│   └── settings.local.json    # Hook configuration
├── docs/
│   ├── features/
│   │   └── INDEX.md           # Feature tracking index
│   ├── requirement/
│   │   └── INDEX.md           # Requirement tracking
│   └── daily_work_summary/    # Daily work logs
└── CLAUDE.md                  # Project instructions for Claude
```

## Customization

### Adding custom commands

Create `.claude/commands/your-command.md`:

```markdown
---
description: What this command does
---

# Your Command

Instructions for Claude to follow when user runs `/your-command`
```

### Adding custom hooks

1. Create script in `.claude/hooks/`
2. Add to `.claude/settings.local.json`:

```json
{
  "hooks": {
    "UserPromptSubmit": [
      {
        "hooks": [
          {
            "type": "command",
            "command": "bash .claude/hooks/your-hook.sh",
            "timeout": 5
          }
        ]
      }
    ]
  }
}
```

### Hook return codes

- `exit 0` - Allow, output injected as context
- `exit 2` - Block the tool call

## Best Practices

### Feature Tracking

1. **Always check INDEX.md** before starting work
2. **Create feature first** - One feature per logical unit of work
3. **Use refs:** to link requirements
4. **Update daily** - Keep progress current

### Git Safety

1. **Explicit staging** - Always `git add file1 file2`, never `git add -A`
2. **Review before commit** - Check `git status` and `git diff`
3. **Meaningful messages** - Describe the "why", not just the "what"

### Session Management

1. **Start with /resume** if continuing previous work
2. **End with /pause** if stopping mid-work
3. **Use /finish** only when feature is complete
4. **Use /snapshot** for quick saves during long sessions

## Troubleshooting

### Hooks not firing

1. Check file permissions: `chmod +x .claude/hooks/*.sh`
2. Verify settings.local.json syntax
3. Check hook script for errors

### Commands not recognized

1. Ensure .claude/commands/ exists in project root
2. Check command file has valid frontmatter
3. Restart Claude Code

### Feature ID conflicts

1. Always read `next_feature_id` from INDEX.md
2. Increment immediately after creating new feature
3. Don't manually assign IDs

## Contributing

Contributions welcome! Please:
1. Fork the repository
2. Create a feature branch
3. Submit a pull request

## License

MIT License - see [LICENSE](LICENSE)

---

**Inspired by the workflows developed for production projects.**
*Because your AI coding assistant should remember what you're working on.*
