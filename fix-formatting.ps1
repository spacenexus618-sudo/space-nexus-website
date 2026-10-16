# Fix formatting issues in pages
$appPath = "C:\Users\Anjana Krishna\spacenexus\spacenexus\app"

# Get all page.tsx files
$pages = Get-ChildItem -Path $appPath -Recurse -Filter "page.tsx" | 
    Where-Object { 
        $_.FullName -notmatch "\\blog\\\[slug\]\\page\.tsx$" -and
        $_.FullName -notmatch "\\kindora\\blog\\\[slug\]\\page\.tsx$"
    }

Write-Host "Checking $($pages.Count) pages for formatting issues"

$fixedCount = 0
foreach ($page in $pages) {
    $content = Get-Content -Path $page.FullName -Raw
    
    # Fix the pattern where </div> is on the same line as the LastUpdated component
    if ($content -match '</div></div>$') {
        $content = $content -replace '</div></div>$', "</div>`n            </div>"
        Set-Content -Path $page.FullName -Value $content -NoNewline
        Write-Host "Fixed: $($page.Name)"
        $fixedCount++
    }
}

Write-Host "`nFixed $fixedCount pages"