$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  url           = 'https://www.bungenstock.de/aepctl/releases/v0.1.1/aepctl-windows-386.tgz'
  url64bit      = 'https://www.bungenstock.de/aepctl/releases/v0.1.1/aepctl-windows-amd64.tgz'
  checksum      = 'b873f3f810566c9034b1c2fcb7118790eb314988546e52521df8112ea6bf12c6'
  checksumType  = 'sha256'
  checksum64    = '9fd44e1d0197b515ef53692f778b8d3ecc27195e0f407b7fb87a4433790d5f21'
  checksumType64= 'sha256'
}
Install-ChocolateyZipPackage @packageArgs

if (Test-Path "$toolsDir\aepctl*.tar") {
  $packageArgs2 = @{
    packageName    = $env:ChocolateyPackageName
    fileFullPath   = Get-Item $toolsDir\*-386.tar
    fileFullPath64 = Get-Item $toolsDir\*-amd64.tar
    destination    = $toolsDir
  }
  Get-ChocolateyUnzip @packageArgs2

  Remove-Item "$toolsDir\aepctl*.tar"
}