# Script to add LastUpdated component to all pages
# Excludes blog post pages which already have dates

$appPath = "C:\Users\Anjana Krishna\spacenexus\spacenexus\app"
$lastUpdatedDate = "2026-07-19" # Today's date

# Get all page.tsx files
$pages = Get-ChildItem -Path $appPath -Recurse -Filter "page.tsx" | 
    Where-Object { 
        $_.FullName -notmatch "\\blog\\\[slug\]\\page\.tsx$" -and
        $_.FullName -notmatch "\\kindora\\blog\\\[slug\]\\page\.tsx$"
    }

Write-Host "Found $($pages.Count) pages to update"

foreach ($page in $pages) {
    $content = Get-Content -Path $page.FullName -Raw
    
    # Skip if already has LastUpdated import
    if ($content -match "import LastUpdated") {
        Write-Host "Skipping (already has import): $($page.FullName)"
        continue
    }
    
    # Add import for LastUpdated component
    $importLine = "import LastUpdated from `"../components/LastUpdated`";"
    
    # Calculate relative path to components
    $relativePath = $page.FullName.Replace($appPath, "").TrimStart("\")
    $depth = ($relativePath.Split("\").Count - 1)
    $importPrefix = ("../" * $depth)
    
    # Fix import path based on page location
    if ($page.FullName -match "\\app\\kindora\\") {
        if ($page.FullName -match "\\kindora\\[^\\]+\\page\.tsx$") {
            # Pages directly in kindora subfolders (kindora/features/page.tsx)
            $importLine = "import LastUpdated from `"../components/LastUpdated`";"
        } else {
            # Deeper nested kindora pages
            $importLine = "import LastUpdated from `"../../components/LastUpdated`";"
        }
    } elseif ($page.FullName -match "\\app\\[^\\]+\\page\.tsx$") {
        # Pages in app subfolders (features/page.tsx, about/page.tsx)
        $importLine = "import LastUpdated from `"../components/LastUpdated`";"
    } elseif ($page.FullName -match "\\app\\page\.tsx$") {
        # Root page (homepage)
        $importLine = "import LastUpdated from `"./components/LastUpdated`";"
    } else {
        # Deeply nested pages
        $importLine = "import LastUpdated from `"${importPrefix}components/LastUpdated`";"
    }
    
    # Add import after existing imports (find last import line)
    $lines = $content -split "`n"
    $lastImportIndex = -1
    for ($i = 0; $i -lt $lines.Count; $i++) {
        if ($lines[$i] -match "^import ") {
            $lastImportIndex = $i
        }
    }
    
    if ($lastImportIndex -ge 0) {
        $lines = $lines[0..$lastImportIndex] + @($importLine) + $lines[($lastImportIndex + 1)..($lines.Count - 1)]
    }
    
    # Find the last closing div before the final export/function end
    # We'll add LastUpdated just before the last </div>
    $content = $lines -join "`n"
    
    # Add the LastUpdated component before the last </div>
    $lastDivIndex = $content.LastIndexOf("</div>")
    if ($lastDivIndex -gt 0) {
        $lastUpdatedHtml = @"

            {/* Last Updated */}
            <div className="py-6 text-center border-t border-gray-100 mt-8">
                <LastUpdated date="$lastUpdatedDate" />
            </div>
"@
        $content = $content.Insert($lastDivIndex, $lastUpdatedHtml)
    }
    
    Set-Content -Path $page.FullName -Value $content -NoNewline
    Write-Host "Updated: $($page.FullName)"
}

Write-Host "`nDone! Updated $($pages.Count) pages"