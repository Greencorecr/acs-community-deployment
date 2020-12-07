Install-WindowsFeature -Name Hyper-V,Containers -IncludeAllSubFeature -IncludeManagementTools
Install-Module -Name DockerMsftProvider -Repository PSGallery -Force
Install-Package -Name docker -ProviderName DockerMsftProvider
[Environment]::SetEnvironmentVariable("LCOW_SUPPORTED", "1", "Machine")
$configfile = @"

{

    "experimental": true

}

"@

New-Item -itemtype directory -path C:\ProgramData\docker\config
$configfile|Out-File -FilePath C:\ProgramData\docker\config\daemon.json -Encoding ascii -Force
Invoke-WebRequest -Uri "https://github.com/linuxkit/lcow/releases/download/v4.14.35-v0.3.9/release.zip" -UseBasicParsing -OutFile release.zip
Expand-Archive release.zip -DestinationPath "$Env:ProgramFiles\Linux Containers\."
[Environment]::SetEnvironmentVariable("LCOW_API_PLATFORM_IF_OMITTED", "linux", "Machine")
#Restart-Computer
