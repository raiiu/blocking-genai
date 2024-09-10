# Define the paths
$hostsPath = "C:\WINDOWS\System32\drivers\etc\hosts"
$backupHostsPath = "C:\WINDOWS\System32\drivers\etc\oldhosts"

Copy-Item -Path $backupHostsPath -Destination $hostsPath -Force

# Flush the DNS cache
ipconfig /flushdns

# Output a success message
Write-Host "Hosts file restored from 'oldhosts'. Generative AI access is now unblocked."
