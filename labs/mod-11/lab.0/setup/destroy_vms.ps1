# pwsh
# This script is distributed on an "as is" basis
# without warranties or conditions of any kind.
# Feel free to modify or use it.

$Env:VAGRANT_EXPERIMENTAL="disks"
Measure-Command { & 'C:\HashiCorp\Vagrant\bin\vagrant.exe' destroy --color --force | Out-Default }
