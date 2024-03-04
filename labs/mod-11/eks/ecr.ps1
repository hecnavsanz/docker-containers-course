# # 1. create an ecr private repository
& 'C:\Program Files\Amazon\AWSCLIV2\aws.exe' ecr create-repository --repository-name core-repo --image-scanning-configuration scanOnPush=true --region  tutu-zone
# repository:
#   createdAt: '2022-09-15T17:40:25+02:00'
#   encryptionConfiguration:
#     encryptionType: AES256
#   imageScanningConfiguration:
#     scanOnPush: true
#   imageTagMutability: MUTABLE
#   registryId: ' '
#   repositoryArn: arn:aws:ecr: tutu-zone: :repository/core-repo
#   repositoryName: core-repo
#   repositoryUri:  IP.dkr.ecr.tutu-zone.amazonaws.com/core-repo

# # 2. get logged into ecr in your laptop
& 'C:\Program Files\Amazon\AWSCLIV2\aws.exe' ecr get-login-password --region  tutu-zone
# ******
docker login --username AWS  IP.dkr.ecr.tutu-zone.amazonaws.com/core-repo # use the repositoryUri above
# Password:  ******
# Login Succeeded

# # 3. list images and tag nodejs-app image with the erc_tag tag to the ecr repository
docker images
# REPOSITORY                        TAG                  IMAGE ID       CREATED        SIZE
# meandnz/nodejs-app-img           latest               3a04d47b4df0   3 hours ago    87MB
# meand/demo                  nodejs-app-img       3a04d47b4df0   3 hours ago    87MB
# localhost:5001/nodejs-app         1.0                  3a04d47b4df0   3 hours ago    87MB
docker tag 3a04d47b4df0  IP.dkr.ecr.tutu-zone.amazonaws.com/core-repo:erc_tag
docker images
# REPOSITORY                                                  TAG                  IMAGE ID       CREATED        SIZE
# meandnz/nodejs-app-img                                     latest               3a04d47b4df0   12 hours ago   87MB
# meand/demo                                            nodejs-app-img       3a04d47b4df0   12 hours ago   87MB
# localhost:5001/nodejs-app                                   1.0                  3a04d47b4df0   12 hours ago   87MB
#  IP.dkr.ecr.tutu-zone.amazonaws.com/core-repo   erc_tag              3a04d47b4df0   12 hours ago   87MB
# ubuntu                                                      latest               2dc39ba059dc   13 days ago    77.8MB

# # 4. push the tagged nodejs-app image to the core-repo ecr repository
docker push  IP.dkr.ecr.tutu-zone.amazonaws.com/core-repo:erc_tag
# The push refers to repository [ IP.dkr.ecr.tutu-zone.amazonaws.com/core]
# 1ee06cf2afc3: Pushed
# 4540a2d0ef41: Pushed
# 7c303c92e7a5: Pushed
# 5f70bf18a086: Pushed
# 38e0db5eeb30: Pushed
# edff9ff691d5: Pushed
# cbe4b9146f86: Pushed
# a6524c5b12a6: Pushed
# 9a5d14f9f550: Pushed
# erc_tag: digest: sha256:ea879e198c0503314701005a8b70d36a1e838df1d04167ac12223d902ab91bfe size: 2197
docker images
# REPOSITORY                                                  TAG                  IMAGE ID       CREATED        SIZE
#  IP.dkr.ecr.tutu-zone.amazonaws.com/core-repo   erc_tag              3a04d47b4df0   13 hours ago   87MB
# meandnz/nodejs-app-img                                     latest               3a04d47b4df0   13 hours ago   87MB
# meand/demo                                            nodejs-app-img       3a04d47b4df0   13 hours ago   87MB
# localhost:5001/nodejs-app                                   1.0                  3a04d47b4df0   13 hours ago   87MB
# ubuntu                                                      latest               2dc39ba059dc   13 days ago    77.8MB
& 'C:\Program Files\Amazon\AWSCLIV2\aws.exe' ecr list-images --repository-name core-repo --region  tutu-zone
# imageIds:
# - imageDigest: sha256:ea879e198c0503314701005a8b70d36a1e838df1d04167ac12223d902ab91bfe
#   imageTag: erc_tag

# # 5. delete the tagged nodejs-app image (ecr_tag) from the core-repo ecr repository
# & 'C:\Program Files\Amazon\AWSCLIV2\aws.exe' ecr batch-delete-image --repository-name core-repo --image-ids imageTag=erc_tag --region  tutu-zone
# failures: []
# imageIds:
# - imageDigest: sha256:ea879e198c0503314701005a8b70d36a1e838df1d04167ac12223d902ab91bfe
#   imageTag: erc_tag

# # 6. delete the core-repo ecr repository (warning: you will delete all the images contained in the repository)
# & 'C:\Program Files\Amazon\AWSCLIV2\aws.exe' ecr delete-repository --repository-name core-repo --force --region  tutu-zone
# repository:
#   createdAt: '2022-09-15T17:40:25+02:00'
#   imageTagMutability: MUTABLE
#   registryId: ' '
#   repositoryArn: arn:aws:ecr: tutu-zone: :repository/core-repo
#   repositoryName: core-repo
#   repositoryUri:  IP.dkr.ecr.tutu-zone.amazonaws.com/core-repo
