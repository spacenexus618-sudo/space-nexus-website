$appDir = "C:\Users\Anjana Krishna\spacenexus\spacenexus\app"

$files = Get-ChildItem -Path $appDir -Recurse -Include '*.tsx','*.jsx'

foreach ($file in $files) {
    $content = Get-Content $file.FullName -Raw -ErrorAction SilentlyContinue
    if (-not $content) { continue }
    $original = $content

    # Fix duplicate: text-3xl sm:text-3xl -> text-3xl sm:text-4xl
    $content = $content -replace 'text-3xl sm:text-3xl', 'text-3xl sm:text-4xl'

    # Fix duplicate: xl:text-5xl xl:text-6xl -> xl:text-5xl (remove duplicate breakpoint)
    $content = $content -replace 'xl:text-5xl xl:text-6xl', 'xl:text-5xl'

    # Fix remaining standalone text-4xl (not followed by responsive modifier)
    # Match text-4xl followed by space and not sm:, lg:, or xl:
    $content = $content -replace 'text-4xl font-bold', 'text-3xl sm:text-4xl font-bold'
    $content = $content -replace 'text-4xl font-black', 'text-3xl sm:text-4xl font-black'
    $content = $content -replace 'text-4xl font-semibold', 'text-3xl sm:text-4xl font-semibold'

    if ($content -ne $original) {
        Set-Content $file.FullName $content -NoNewline -ErrorAction SilentlyContinue
        Write-Host "Fixed: $($file.Name)"
    }
}

# Also fix the tutorial template
$templateFile = "C:\Users\Anjana Krishna\spacenexus\spacenexus\scripts\tutorial-template.tsx"
if (Test-Path $templateFile) {
    $content = Get-Content $templateFile -Raw -ErrorAction SilentlyContinue
    $original = $content
    $content = $content -replace 'text-3xl sm:text-3xl', 'text-3xl sm:text-4xl'
    $content = $content -replace 'xl:text-5xl xl:text-6xl', 'xl:text-5xl'
    if ($content -ne $original) {
        Set-Content $templateFile $content -NoNewline -ErrorAction SilentlyContinue
        Write-Host "Fixed: tutorial-template.tsx"
    }
}

Write-Host "`nDone! Duplicate patterns fixed."
