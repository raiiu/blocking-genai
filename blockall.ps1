# Define the paths
$hostsPath = "C:\WINDOWS\System32\drivers\etc\hosts"
$backupHostsPath = "C:\WINDOWS\System32\drivers\etc\oldhosts"
$addContentHostsPath = "C:\WINDOWS\System32\drivers\etc\addcontenthosts"

# Create the addcontenthosts file with the desired content
$content = @(
""
"127.0.0.1 chat.openai.com"
"127.0.0.1 chatgpt.com"
"127.0.0.1 copilot.microsoft.com"
"127.0.0.1 gemini.google.com"
"127.0.0.1 character.ai"
"127.0.0.1 chatpdf.com"
"127.0.0.1 writesonic.com"
"127.0.0.1 pi.ai"
""
)
Set-Content -Path $addContentHostsPath -Value $content -Force

# Backup the current hosts file
Copy-Item -Path $hostsPath -Destination $backupHostsPath -Force

# Append the content from addcontenthosts to the hosts file
Add-Content -Path $hostsPath -Value (Get-Content $addContentHostsPath)

ipconfig /flushdns 

# Output a success message
Write-Host "Content added to hosts file and old hosts file backed up as 'oldhosts'."

