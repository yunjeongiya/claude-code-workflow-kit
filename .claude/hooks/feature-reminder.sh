#!/bin/bash
# UserPromptSubmit hook: Remind to track features
# Fires on every user prompt submission
# stdout → injected into Claude's context

echo "FEATURE_TRACKER: If starting new work, check docs/features/INDEX.md for existing features or create a new one. All work should be tracked via Features."
exit 0
