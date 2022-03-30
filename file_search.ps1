function search {
  param($search)
  $drives = $drives = (get-volume | where-Object {$_.DriveLetter -like "?"}).DriveLetter
  foreach ($drive in $drives) {
    Write-Host "[*]Searching in $drive`:\"
    $files += Get-ChildItem -Recurse -Path "$drive`:\" -Filter "*.txt" -ErrorAction SilentlyContinue | Select-String "$search" -List -ErrorAction SilentlyContinue | Select Path  
  }

  foreach ($file in $files.Path) {
    if ("$file" -like "*txt*") {
        Write-Host "[+] $file"
    }
  }
}
