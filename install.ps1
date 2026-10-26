# Copies the skills and agents into your personal Claude Code folder (~/.claude).
# Use this if you'd rather not install the plugin.
$dest = Join-Path $env:USERPROFILE ".claude"
New-Item -ItemType Directory -Force (Join-Path $dest "skills"), (Join-Path $dest "agents") | Out-Null
Copy-Item -Recurse -Force "$PSScriptRoot\skills\*" (Join-Path $dest "skills")
Copy-Item -Force "$PSScriptRoot\agents\*.md" (Join-Path $dest "agents")
Write-Host "Installed to $dest. Start a new Claude Code session and run /viral-video."
