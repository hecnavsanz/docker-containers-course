# pwsh
$env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")
$dockerPath = (Get-Command -Name docker.exe).Source

& "$dockerPath" tag alpine:latest localhost:5000/alpine:latest

& "$dockerPath" login localhost:5000
# Username: admin
# Password: ********** <-- core.2FORMACION
# Login Succeeded
# -or- 
# Authenticating with existing credentials...
# Login Succeeded

& "$dockerPath" images

& "$dockerPath" push localhost:5000/alpine:latest
# 994393dc58e7: Pushed
# latest: digest: sha256:1304f174557314a7ed9eddb4eab12fed12cb0cd9809e4c28f29af86979a3c870 size: 528

& "$dockerPath" image remove localhost:5000/alpine:latest
# Untagged: localhost:5000/alpine:latest
# Untagged: localhost:5000/alpine@sha256:1304f174557314a7ed9eddb4eab12fed12cb0cd9809e4c28f29af86979a3c870

curl -X GET -u admin:core.2FORMACION -k https://localhost:5000/v2/_catalog 
# {"repositories":["alpine"]}
curl -X GET -u admin:core.2FORMACION -k https://localhost:5000/v2/alpine/tags/list
# {"name":"alpine","tags":["latest"]}


& "$dockerPath" exec -it gitlab-registry cat /etc/docker/registry/config.yml
# version: 0.1
# ...
# health:
#   storagedriver:
#     enabled: true
#     interval: 10s
#     threshold: 3
# delete:          # to enable delete images too
#   enabled: true

curl -X GET -u admin:core.2FORMACION -k -H 'Accept: application/vnd.docker.distribution.manifest.v2+json' https://localhost:5000/v2/alpine/manifests/latest                
# {
#    "schemaVersion": 2,
#    "mediaType": "application/vnd.docker.distribution.manifest.v2+json",
#    "config": {
#       "mediaType": "application/vnd.docker.container.image.v1+json",
#       "size": 1470,
#       "digest": "sha256:9c6f0724472873bb50a2ae67a9e7adcb57673a183cea8b06eb778dca859181b5"
#    },
#    "layers": [
#       {
#          "mediaType": "application/vnd.docker.image.rootfs.diff.tar.gzip",
#          "size": 2806054,
#          "digest": "sha256:213ec9aee27d8be045c6a92b7eac22c9a64b44558193775a1a7f626352392b49"
#       }
#    ]
# }

curl -X DELETE -u admin:core.2FORMACION -k https://localhost:5000/v2/alpine/manifests/sha256:9c6f0724472873bb50a2ae67a9e7adcb57673a183cea8b06eb778dca859181b5

# hecto in MSI in labs\mod-06\lab.1 via 16GiB/32GiB | 3GiB/15GiB
# [ 07:43:13 ] ❯ docker tag nginx:latest localhost:5000/nginx:repo

# hecto in MSI in labs\mod-06\lab.1 via 16GiB/32GiB | 3GiB/15GiB
# [ 07:44:03 ] ❯ docker images
# REPOSITORY             TAG       IMAGE ID       CREATED        SIZE
# gitlab-tls             latest    8a9bfc14533f   2 days ago     8.69MB
# registry               2         dcb3d42c1744   5 days ago     24.1MB
# localhost:5000/nginx   repo      51086ed63d8c   6 days ago     142MB
# nginx                  latest    51086ed63d8c   6 days ago     142MB
# httpd                  2         d16a51d08814   7 days ago     145MB
# gitlab/gitlab-ce       latest    98ddb2e28063   7 days ago     2.72GB
# alpine                 latest    9c6f07244728   2 months ago   5.54MB

# hecto in MSI in labs\mod-06\lab.1 via 16GiB/32GiB | 3GiB/15GiB
# [ 07:44:06 ] ❯ docker push localhost:5000/nginx:repo
# The push refers to repository [localhost:5000/nginx]
# d6a3537fc36a: Pushed
# 819eb3a45632: Pushed
# 5eda6fa69be4: Pushed
# 6f4f3ce1dca0: Pushed
# 58a06a0d345c: Pushed
# fe7b1e9bf792: Pushed
# repo: digest: sha256:bab399017a659799204147065aab53838ca6f5aeed88cf7d329bc4fda1d2bac7 size: 1570

# hecto in MSI in labs\mod-06\lab.1 via 16GiB/32GiB | 3GiB/15GiB took 4s
# [ 07:44:21 ] ❯ docker images
# REPOSITORY             TAG       IMAGE ID       CREATED        SIZE
# gitlab-tls             latest    8a9bfc14533f   2 days ago     8.69MB
# registry               2         dcb3d42c1744   5 days ago     24.1MB
# nginx                  latest    51086ed63d8c   6 days ago     142MB
# localhost:5000/nginx   repo      51086ed63d8c   6 days ago     142MB
# httpd                  2         d16a51d08814   7 days ago     145MB
# gitlab/gitlab-ce       latest    98ddb2e28063   7 days ago     2.72GB
# alpine                 latest    9c6f07244728   2 months ago   5.54MB

# hecto in MSI in labs\mod-06\lab.1 via 16GiB/32GiB | 3GiB/15GiB
# [ 07:44:24 ] ❯ docker rmi nginx
# Untagged: nginx:latest
# Untagged: nginx@sha256:2f770d2fe27bc85f68fd7fe6a63900ef7076bc703022fe81b980377fe3d27b70

# hecto in MSI in labs\mod-06\lab.1 via 16GiB/32GiB | 3GiB/15GiB
# [ 07:44:36 ] ❯ docker images   
# REPOSITORY             TAG       IMAGE ID       CREATED        SIZE
# gitlab-tls             latest    8a9bfc14533f   2 days ago     8.69MB
# registry               2         dcb3d42c1744   5 days ago     24.1MB
# localhost:5000/nginx   repo      51086ed63d8c   6 days ago     142MB
# httpd                  2         d16a51d08814   7 days ago     145MB
# gitlab/gitlab-ce       latest    98ddb2e28063   7 days ago     2.72GB
# alpine                 latest    9c6f07244728   2 months ago   5.54MB

# hecto in MSI in labs\mod-06\lab.1 via 16GiB/32GiB | 3GiB/15GiB
# [ 07:44:38 ] ❯ docker tag localhost:5000/nginx:repo nginx:repo

# hecto in MSI in labs\mod-06\lab.1 via 16GiB/32GiB | 3GiB/15GiB
# [ 07:44:51 ] ❯ docker images
# REPOSITORY             TAG       IMAGE ID       CREATED        SIZE
# gitlab-tls             latest    8a9bfc14533f   2 days ago     8.69MB
# registry               2         dcb3d42c1744   5 days ago     24.1MB
# nginx                  repo      51086ed63d8c   6 days ago     142MB
# localhost:5000/nginx   repo      51086ed63d8c   6 days ago     142MB
# httpd                  2         d16a51d08814   7 days ago     145MB
# gitlab/gitlab-ce       latest    98ddb2e28063   7 days ago     2.72GB
# alpine                 latest    9c6f07244728   2 months ago   5.54MB

# hecto in MSI in labs\mod-06\lab.1 via 16GiB/32GiB | 3GiB/15GiB
# [ 07:44:24 ] ❯ docker rmi localhost:5000/nginx:repo
# Untagged: nginx:latest
# Untagged: nginx@sha256:2f770d2fe27bc85f68fd7fe6a63900ef7076bc703022fe81b980377fe3d27b70

# hecto in MSI in labs\mod-06\lab.1 via 16GiB/32GiB | 3GiB/15GiB 
# [ 07:46:08 ] ❯ docker images
# REPOSITORY         TAG       IMAGE ID       CREATED        SIZE
# gitlab-tls         latest    8a9bfc14533f   2 days ago     8.69MB
# registry           2         dcb3d42c1744   5 days ago     24.1MB
# nginx              repo      51086ed63d8c   6 days ago     142MB
# httpd              2         d16a51d08814   7 days ago     145MB
# gitlab/gitlab-ce   latest    98ddb2e28063   7 days ago     2.72GB
# alpine             latest    9c6f07244728   2 months ago   5.54MB

# hecto in MSI in labs\mod-06\lab.1 via 16GiB/32GiB | 3GiB/15GiB
# [ 07:51:43 ] ❯ curl -X GET -u admin:core.2FORMACION -k -H 'Accept: application/vnd.docker.distribution.manifest.v2+json' -v https://localhost:5000/v2/nginx/manifests/repo  
# Note: Unnecessary use of -X or --request, GET is already inferred.
# *   Trying 127.0.0.1:5000...
# * Connected to localhost (127.0.0.1) port 5000 (#0)
# * schannel: disabled automatic use of client certificate
# * ALPN: offers http/1.1
# * ALPN: server accepted http/1.1
# * Server auth using Basic with user 'admin'
# > GET /v2/nginx/manifests/repo HTTP/1.1
# > Host: localhost:5000
# > Authorization: Basic YWRtaW46aW1hZ2luYS4yRk9STUFDSU9O
# > User-Agent: curl/7.83.1
# > Accept: application/vnd.docker.distribution.manifest.v2+json
# >
# * Mark bundle as not supporting multiuse
# < HTTP/1.1 200 OK
# < Content-Length: 1570
# < Content-Type: application/vnd.docker.distribution.manifest.v2+json
# < Docker-Content-Digest: sha256:bab399017a659799204147065aab53838ca6f5aeed88cf7d329bc4fda1d2bac7
# < Docker-Distribution-Api-Version: registry/2.0
# < Etag: "sha256:bab399017a659799204147065aab53838ca6f5aeed88cf7d329bc4fda1d2bac7"
# < X-Content-Type-Options: nosniff
# < Date: Wed, 12 Oct 2022 11:51:54 GMT
# <
# {
#    "schemaVersion": 2,
#    "mediaType": "application/vnd.docker.distribution.manifest.v2+json",
#    "config": {
#       "mediaType": "application/vnd.docker.container.image.v1+json",
#       "size": 7658,
#       "digest": "sha256:51086ed63d8cba3a6a3d94ecd103e9638b4cb8533bb896caf2cda04fb79b862f"
#    },
#    "layers": [
#       {
#          "mediaType": "application/vnd.docker.image.rootfs.diff.tar.gzip",
#          "size": 31420102,
#          "digest": "sha256:bd159e379b3b1bc0134341e4ffdeab5f966ec422ae04818bb69ecef08a823b05"
#       },
#       {
#          "mediaType": "application/vnd.docker.image.rootfs.diff.tar.gzip",
#          "size": 25349492,
#          "digest": "sha256:8d634ce99fb933cae83bf1ebc98ca6a4bc683f632320ececee060ea84d2785fe"
#       },
#       {
#          "mediaType": "application/vnd.docker.image.rootfs.diff.tar.gzip",
#          "size": 602,
#          "digest": "sha256:98b0bbcc0ec67f3b41dc3140ee2fe804d410548392307a2c6d4f9921ea30261f"
#       },
#       {
#          "mediaType": "application/vnd.docker.image.rootfs.diff.tar.gzip",
#          "size": 893,
#          "digest": "sha256:6ab6a6301bdeddbcd0e6193262b2c54740f4ea12640c81c951223cdd5ec842a3"
#       },
#       {
#          "mediaType": "application/vnd.docker.image.rootfs.diff.tar.gzip",
#          "size": 665,
#          "digest": "sha256:f5d8edcd47b1b04e279cc2414cad5c38b423d1d5ee9801ca7c81ef63d0941c98"
#       },
#       {
#          "mediaType": "application/vnd.docker.image.rootfs.diff.tar.gzip",
#          "size": 1394,
#          "digest": "sha256:fe24ce36f968b9315f7713fee767d50444dea2b59951f171054cb4e3c12d4b81"
#       }
#    ]
# }* Connection #0 to host localhost left intact


# hecto in MSI in labs\mod-06\lab.1 via 16GiB/32GiB | 3GiB/15GiB 
# [ 07:52:45 ] ❯ curl -X DELETE -u admin:core.2FORMACION -k https://localhost:5000/v2/nginx/manifests/sha256:51086ed63d8cba3a6a3d94ecd103e9638b4cb8533bb896caf2cda04fb79b862f -v 
# *   Trying 127.0.0.1:5000...
# * Connected to localhost (127.0.0.1) port 5000 (#0)
# * schannel: disabled automatic use of client certificate
# * ALPN: offers http/1.1
# * ALPN: server accepted http/1.1
# * Server auth using Basic with user 'admin'
# > DELETE /v2/nginx/manifests/sha256:51086ed63d8cba3a6a3d94ecd103e9638b4cb8533bb896caf2cda04fb79b862f HTTP/1.1
# > Host: localhost:5000
# > Authorization: Basic YWRtaW46aW1hZ2luYS4yRk9STUFDSU9O
# > User-Agent: curl/7.83.1
# > Accept: */*
# > 
# * Mark bundle as not supporting multiuse
# < HTTP/1.1 202 Accepted
# < Docker-Distribution-Api-Version: registry/2.0
# < X-Content-Type-Options: nosniff
# < Date: Wed, 12 Oct 2022 11:54:22 GMT
# < Content-Length: 0
# < 
# * Connection #0 to host localhost left intact
