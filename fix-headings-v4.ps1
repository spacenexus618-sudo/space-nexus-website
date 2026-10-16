$appDir = "C:\Users\Anjana Krishna\spacenexus\spacenexus\app"

$files = Get-ChildItem -Path $appDir -Recurse -Include '*.tsx','*.jsx'

foreach ($file in $files) {
    $content = Get-Content $file.FullName -Raw -ErrorAction SilentlyContinue
    if (-not $content) { continue }
    $original = $content

    # Fix: text-2xl lg:text-3xl xl:text-3xl sm:text-4xl -> text-2xl lg:text-3xl xl:text-4xl
    # This removes the duplicate xl:text-3xl and adds the correct xl:text-4xl
    $content = $content -replace 'text-2xl lg:text-3xl xl:text-3xl sm:text-4xl', 'text-2xl lg:text-3xl xl:text-4xl'

    if ($content -ne $original) {
        Set-Content $file.FullName $content -NoNewline -ErrorAction SilentlyContinue
        Write-Host "Fixed: $($file.Name)"
    }
}

Write-Host "`nDone! Final xl breakpoint fixes applied."
