$pubIP = Invoke-WebRequest http://ipecho.net/plain
$curdate = Get-Date -Format "yyyymmddTHHMMss"
Write-Output "$curdate, $pubIP" | Out-File -Append -Encoding ASCII $args[0]