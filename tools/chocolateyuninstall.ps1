$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
. "$toolsDir\commonEnv.ps1"

& $ENV:COMSPEC /C IF EXIST $pk3_lnk DEL /S /Q $pk3_lnk
