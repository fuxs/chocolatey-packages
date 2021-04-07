$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  url           = 'https://www.bungenstock.de/aepctl/releases/v0.2.0/aepctl-windows-386.tgz'
  url64bit      = 'https://www.bungenstock.de/aepctl/releases/v0.2.0/aepctl-windows-amd64.tgz'
  checksum      = 'd42193b092baf3bbafd3ba42e8b8beaf16c6f7ec08bb418b4da1da8020a1be2a'
  checksumType  = 'sha256'
  checksum64    = '34b4a807c9b9e7b3ba6e057d0a09e3ea1e05a405e7d360e02f91afa8d9a2c12b'
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