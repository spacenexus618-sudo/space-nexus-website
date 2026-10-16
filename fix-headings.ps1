$appDir = "C:\Users\Anjana Krishna\spacenexus\spacenexus\app"

# Pattern 1: text-4xl sm:text-5xl lg:text-6xl -> text-3xl sm:text-4xl lg:text-5xl xl:text-6xl
# Pattern 2: text-4xl sm:text-5xl (not followed by lg:) -> text-3xl sm:text-4xl lg:text-5xl
# Pattern 3: text-3xl lg:text-4xl -> text-2xl lg:text-3xl xl:text-4xl (for h2 subheadings)
# Pattern 4: text-4xl lg:text-5xl (stats) -> text-3xl lg:text-4xl xl:text-5xl

$files = Get-ChildItem -Path $appDir -Recurse -Include '*.tsx','*.jsx'

foreach ($file in $files) {
    $content = Get-Content $file.FullName -Raw
    $original = $content

    # Pattern 1: h1 with 3 breakpoints (text-4xl sm:text-5xl lg:text-6xl -> text-3xl sm:text-4xl lg:text-5xl xl:text-6xl)
    $content = $content -replace 'text-4xl sm:text-5xl lg:text-6xl', 'text-3xl sm:text-4xl lg:text-5xl xl:text-6xl'

    # Pattern 2: h1 with 2 breakpoints (text-4xl sm:text-5xl -> text-3xl sm:text-4xl lg:text-5xl)
    $content = $content -replace 'text-4xl sm:text-5xl', 'text-3xl sm:text-4xl lg:text-5xl'

    # Pattern 3: h2 subheadings (text-3xl lg:text-4xl -> text-2xl lg:text-3xl xl:text-4xl)
    $content = $content -replace 'text-3xl lg:text-4xl', 'text-2xl lg:text-3xl xl:text-4xl'

    # Pattern 4: stats (text-4xl lg:text-5xl -> text-3xl lg:text-4xl xl:text-5xl)
    $content = $content -replace 'text-4xl lg:text-5xl', 'text-3xl lg:text-4xl xl:text-5xl'

    # Pattern 5: standalone text-4xl in headings (text-4xl" -> text-3xl sm:text-4xl") - only in className
    $content = $content -replace 'className="text-4xl ', 'className="text-3xl sm:text-4xl '

    if ($content -ne $original) {
        Set-Content $file.FullName $content -NoNewline
        Write-Host "Updated: $($file.Name)"
    }
}

# Also update the tutorial template
$templateFile = "C:\Users\Anjana Krishna\spacenexus\spacenexus\scripts\tutorial-template.tsx"
if (Test-Path $templateFile) {
    $content = Get-Content $templateFile -Raw
    $original = $content
    $content = $content -replace 'text-4xl sm:text-5xl', 'text-3xl sm:text-4xl lg:text-5xl'
    if ($content -ne $original) {
        Set-Content $templateFile $content -NoNewline
        Write-Host "Updated: tutorial-template.tsx"
    }
}

Write-Host "`nDone! All heading sizes updated."
