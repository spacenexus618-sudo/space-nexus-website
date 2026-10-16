$appDir = "C:\Users\Anjana Krishna\spacenexus\spacenexus\app"

$files = Get-ChildItem -Path $appDir -Recurse -Include '*.tsx','*.jsx'

foreach ($file in $files) {
    $content = Get-Content $file.FullName -Raw -ErrorAction SilentlyContinue
    if (-not $content) { continue }
    $original = $content

    # Fix: text-3xl sm:text-4xl lg:text-4xl xl:text-5xl -> text-3xl sm:text-4xl lg:text-5xl
    # This happens when original was text-4xl sm:text-5xl and got double-transformed
    $content = $content -replace 'text-3xl sm:text-4xl lg:text-4xl xl:text-5xl', 'text-3xl sm:text-4xl lg:text-5xl'

    # Also fix any remaining: lg:text-4xl xl:text-5xl -> lg:text-5xl (when preceded by sm:text-4xl)
    $content = $content -replace 'sm:text-4xl lg:text-4xl', 'sm:text-4xl lg:text-5xl'

    if ($content -ne $original) {
        Set-Content $file.FullName $content -NoNewline -ErrorAction SilentlyContinue
        Write-Host "Fixed: $($file.Name)"
    }
}

Write-Host "`nDone! Final heading fixes applied."
