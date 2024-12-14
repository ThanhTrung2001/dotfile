# Function for reuse
function Write-Start {
  param ($msg)
  Write-Host(">> " + $msg) - ForegroundColor Blue
}

function Write-Done {
  Write-Host(">> " + $msg) - ForegroundColor Green; Write-Host
}

#Note: Run this if no execution policy error: Set-ExecutionPolicy RemoteSigned -Scope CurrentUser

#Script for start
Start-Process -Wait powershell -Verb runAs -ArgumentList "Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System -Name ConsentPromptBehaviorAdmin -Value 0"

#Scoop
Write-Start -msg "Installing scoop..."
if (Get-Command scoop -ErrorAction SilentlyContinue) {
  Write-Warning "Scoop already installed! Skip this step......."
}
else {
  Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
  Invoke-RestMethod get.scoop.sh | Invoke-Expression
}
Write-Done

#Initializing scoop
Write-Start -msg "Initializing scoop..."
scoop install git
scoop bucket add extras
scoop bucket add nerd-fonts
scoop bucket add java
scoop bucket add main
scoop bucket add versions
scoop update
Write-Done

#Install scoop's package (sdk)
Write-Start -msg "Install scoop's package-envionment..."
scoop install main/winget
scoop install main/nodejs-lts
scoop install main/python
scoop install nerd-fonts/0xProto-NF
scoop install main/clink
scoop install main/oh-my-posh
scoop install main/msys2
scoop install main/ripgrep
# Start-Process -Wait powershell -Verb runAs -ArgumentList "scoop install"
Write-Done

#Virtualization Window
Write-Start -msg "Enable Virtualization..."
Start-Process -Wait powershell -verb runas -ArgumentList @"
  echo y | Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V -All -NoRestart
  echo y | Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux -All -NoRestart
  echo y | Enable-WindowsOptionalFeature -Online -FeatureName VirtualMachinePlatform -All
  echo y | Enable-WindowsOptionalFeature -Online -FeatureName Containers -All
"@
Write-Done

#WSL install
Write-Start -msg "Installing WSL..."
If (-not (Get-Command wsl -ErrorAction SilentlyContinue)) {
  wsl --install
  wsl --update
  wsl --install --no-launch --web-download -d Ubuntu
  wsl --set-default-version 2
}
Else {
  Write-Warning "WSL already installed!"
}
Write-Done

#Install scoop's package (app)
Write-Start -msg "Install scoop's package-app..."
winget install --id Microsoft.PowerShell --source winget # powershell 7
scoop install vscode
scoop install neovim
scoop install main/7zip
scoop install extras/winrar
scoop install main/scrcpy
scoop install extras/localsend
scoop install extras/postman
scoop install extras/sqlitebrowser
scoop install extras/figma
scoop install extras/notion
# scoop install main/docker - should install directly by Docker Desktop
Start-Process -Wait powershell -Verb runAs -ArgumentList "scoop install"
Write-Done 



