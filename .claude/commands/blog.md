---
description: Analyze recent work and draft a blog post
tags: [workflow, content]
---

# Blog Post Writing Process

Draft a blog post based on recent work.

## Step 1: Analyze work from this session
- **Check TodoWrite**: Tasks recorded in this session
- **Check git status**: Files modified in this session
- **Check work log**: `docs/daily_work_summary/YYYY-MM-DD.md`
- **Check Feature file**: Feature README.md updated in this session
- **Important**: Analyze only **work done in THIS session**, not entire git log
- Identify core topic:
  - New feature (backend API, frontend UI)
  - Complex problem solving (bug fix, exception handling)
  - Performance improvement (query optimization, rendering)
  - Architecture change (refactoring, pattern adoption)
  - Security improvement
  - User experience improvement

## Step 2: Assess blog suitability
Evaluate based on:
- **Technical value**: Would this help other developers?
- **Depth**: Is there enough complexity to explain?
- **Originality**: Any unique approach or insight?
- **Scope**: Does it span multiple layers (backend+frontend)?

**If not suitable**:
- Inform user: "This work doesn't seem suitable for a blog post"
- Briefly explain why (e.g., simple CRUD, minor bug fix, style changes only)
- End process

**Good examples**:
- JWT authentication in Spring Boot + React
- Solving N+1 query with JPA @EntityGraph
- Server state management with React Query
- Trash/soft delete implementation with recovery logic
- Real-time notifications via Discord bot

## Step 3: User confirmation
If suitable:
- Present topic and key content summary
- Specify which repository (server/web/mobile)
- Ask "Shall I draft a blog post on this topic?"
- End process if user declines

## Step 4: Draft blog post
After user approval:
- Filename: `YYYY-MM-DD-{topic-slug}.md`
- Save location: `docs/insights/`

### Post structure:
```markdown
---
title: [Clear and engaging title]
date: YYYY-MM-DD
tags: [Spring Boot, React, TypeScript, JWT, JPA, etc.]
category: [Backend/Frontend/FullStack]
draft: true
---

# [Title]

## Overview
- Brief project introduction
- What this post covers
- Why this topic matters

## Background
- Problem situation or why improvement was needed
- Limitations of previous approach
- Specific requirements

## Tech Stack
- Backend: [technologies]
- Frontend: [technologies]
- Other: [related tools]

## Solution
### [Section 1 - Backend]
- Specific implementation
- Code examples (key parts only)
- Why implemented this way

### [Section 2 - Frontend]
- UI/UX implementation
- State management
- API integration

### [Section 3 - Integration]
- Backend-frontend connection
- Exception handling
- Testing

## Results
- Improvement effects (performance, readability, maintainability, UX)
- Measurable metrics if available
- Screenshots or diagrams (if needed)

## Learnings and Future Plans
- Insights from this work
- Tips and gotchas
- Future improvement plans

## References
- Official documentation links
- Other references
```

## Step 5: Final guidance
- Report created file path: `docs/insights/YYYY-MM-DD-{topic}.md`
- Note: "This is a draft, please review and edit"
- Mention draft: true status
- Suggest adding diagrams or screenshots if needed

## Important notes
- Keep code concise (summarize if too long)
- Never include security-sensitive information:
  - JWT Secret
  - Database passwords
  - API keys (Discord tokens, etc.)
  - Production environment configs
- Prioritize technical accuracy, don't exaggerate
- Generalize business logic when explaining
- Exclude personal information
