# In Chocolatey scripts, ALWAYS use absolute paths - $toolsDir gets you to the package's tools directory.

$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$fileLocation = Join-Path $toolsDir 'wireguard-amd64-0.0.38.msi'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'msi' #only one of these: exe, msi, msu
  file         = $fileLocation

  softwareName  = 'WireGuard' #part or all of the Display Name as you see it in Programs and Features. It should be enough to be unique

  # MSI
  silentArgs    = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`"" # ALLUSERS=1 DISABLEDESKTOPSHORTCUT=1 ADDDESKTOPICON=0 ADDSTARTMENU=0
  validExitCodes= @(0, 3010, 1641)
  # OTHERS
  # Uncomment matching EXE type (sorted by most to least common)
  # silentArgs   = '/S'           # NSIS
  # silentArgs   = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-' # Inno Setup
  # silentArgs   = '/s'           # InstallShield
  # silentArgs   = '/s /v"/qn"'   # InstallShield with MSI
  # silentArgs   = '/s'           # Wise InstallMaster
  # silentArgs   = '-s'           # Squirrel
  # silentArgs   = '-q'           # Install4j
  # silentArgs   = '-s'           # Ghost
  # validExitCodes= @(0) # please insert other valid exit codes here, comma separated
}

#Install-ChocolateyPackage @packageArgs # https://chocolatey.org/docs/helpers-install-chocolatey-package
Install-ChocolateyInstallPackage @packageArgs # https://chocolatey.org/docs/helpers-install-chocolatey-install-package

## Extra stuff    
## add specific folders to the path - any executables found in the chocolatey package 
## folder will already be on the path. This is used in addition to that or for cases 
## when a native installer doesn't add things to the path.
## - https://chocolatey.org/docs/helpers-install-chocolatey-path

# Install-ChocolateyPath 'LOCATION_TO_ADD_TO_PATH' 'User_OR_Machine' # Machine will assert administrative rights

## Set persistent Environment variables
## - https://chocolatey.org/docs/helpers-install-chocolatey-environment-variable

# Install-ChocolateyEnvironmentVariable -variableName "SOMEVAR" -variableValue "value" [-variableType = 'Machine' #Defaults to 'User']
