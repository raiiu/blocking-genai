# Define the paths
$hostsPath = "C:\WINDOWS\System32\drivers\etc\hosts"
$backupHostsPath = "C:\WINDOWS\System32\drivers\etc\oldhosts"

# Check if the backup file exists
if (Test-Path $backupHostsPath) {
    # Replace the current hosts file with the backup
    Copy-Item -Path $backupHostsPath -Destination $hostsPath -Force
    
    # Flush the DNS cache
    ipconfig /flushdns

    # Output a success message
    Write-Host "Hosts file restored from 'oldhosts'. Generative AI access is now unblocked."
} else {
    # Output an error message if the backup file does not exist
    Write-Host "Error: Backup 'oldhosts' file not found."
}
