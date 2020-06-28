$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
. "$toolsDir\commonEnv.ps1"

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

# Cleanup link first (safely)
& $ENV:COMSPEC /C IF EXIST $pk3_lnk DEL /S /Q $pk3_lnk

# Install symbolic link for later use
$pk3_src = "$(Join-Path $unzipLocation $pk3)"
& $ENV:COMSPEC /C MKLINK $pk3_lnk $pk3_src
