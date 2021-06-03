function dirsize {
  Get-ChildItem |
  Where-Object { $_.PSIsContainer } |
  ForEach-Object {
    $size = (
      Get-ChildItem $_ -Recurse |
      Measure-Object Length -Sum -ErrorAction SilentlyContinue
      ).Sum /1MB;
      $_.Name + ": " + [math]::Round($size, 2) + " mb"
    }
  }
