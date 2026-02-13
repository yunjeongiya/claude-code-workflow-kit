# PreToolUse hook: Prevent dangerous git commands
# Blocks: git commit -a, git add -A, git add .
# stdout -> injected into Claude's context

# Read tool input from stdin (JSON format)
$input = $input | Out-String

# Check for dangerous patterns
if ($input -match "git commit.*-a" -or $input -match "git add -A" -or $input -match "git add \.") {
    Write-Output "BLOCKED: Dangerous git command detected."
    Write-Output "- git commit -a: May include unintended files"
    Write-Output "- git add -A or git add .: May stage sensitive files"
    Write-Output ""
    Write-Output "Instead, explicitly add specific files:"
    Write-Output "  git add file1.ts file2.tsx && git commit -m 'message'"
    exit 2  # Block the tool
}

exit 0  # Allow the tool
