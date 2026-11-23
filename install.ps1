# Installs the skill for Claude Code, Codex and Grok Build (Windows).
$src = Join-Path $PSScriptRoot "skills\video-edit-effects"
foreach ($dest in @("$HOME\.claude\skills", "$HOME\.agents\skills")) {
  New-Item -ItemType Directory -Force -Path $dest | Out-Null
  $target = Join-Path $dest "video-edit-effects"
  if (Test-Path $target) { Remove-Item -Recurse -Force $target }
  Copy-Item -Recurse $src $target
  Write-Host "Installed to $target"
}
Write-Host "Needs ffmpeg and Python 3 (Pillow, faster-whisper) on this machine."
