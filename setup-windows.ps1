$ScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$PromptsDir = Join-Path $ScriptDir "prompts"
$CommandsDir = Join-Path $env:USERPROFILE ".claude\commands"

if (-not (Test-Path $CommandsDir)) {
    New-Item -ItemType Directory -Path $CommandsDir -Force | Out-Null
}

Get-ChildItem "$PromptsDir\*.md" | ForEach-Object {
    $Target = $_.FullName
    $Link = Join-Path $CommandsDir $_.Name

    if (Test-Path $Link) { Remove-Item $Link -Force }

    New-Item -ItemType SymbolicLink -Path $Link -Target $Target | Out-Null
    Write-Host "Linked: $($_.Name)"
}

Write-Host "Done. Commands installed to $CommandsDir"
