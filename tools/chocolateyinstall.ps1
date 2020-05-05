$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$unzipLocation = "$(Join-Path $toolsDir keysncorpses)"
$url = Get-ModdbDlUrl 'https://www.moddb.com/addons/start/186106'
$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $unzipLocation
  url           = $url
  checksum      = '0E51B782B26F41C7FCFB1EAA29D4EA9D77A255A84C362A34A8781590F535D7A3'
  checksumType  = 'sha256'
}
Install-ChocolateyZipPackage @packageArgs
