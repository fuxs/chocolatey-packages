$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  url           = 'https://www.bungenstock.de/aepctl/releases/v0.2.0/aepctl-windows-386.tgz'
  url64bit      = 'https://www.bungenstock.de/aepctl/releases/v0.2.0/aepctl-windows-amd64.tgz'
  checksum      = '0c1c102cf661fd2b928e14de1c2e334bc6360014dc4004deb94db9e99e8b193f'
  checksumType  = 'sha256'
  checksum64    = '8f5330fba92dbbe6009b0ac42c11012e1ffd3ecc56a3d5fd140683415d6fb381'
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