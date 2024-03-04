# pwsh
# This script is distributed on an "as is" basis
# without warranties or conditions of any kind.
# Feel free to modify or use it.

$Env:VAGRANT_EXPERIMENTAL="disks"
# start gitlab server
$srv = "gitlabsrv"
& 'C:\HashiCorp\Vagrant\bin\vagrant.exe' up $srv --color

# start gitlab runners
$rnrs = "gitlabrnr"
foreach( $gitlabrnr in $rnrs ) {
    & 'C:\HashiCorp\Vagrant\bin\vagrant.exe' up $gitlabrnr --color
}
