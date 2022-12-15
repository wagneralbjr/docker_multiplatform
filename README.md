# command to fix multiarch,so arm code can be run in amd64.
docker run --rm --privileged multiarch/qemu-user-static --reset -p yes

# command to check if things are working
ls /proc/sys/fs/binfmt_misc/


# how to build as multiarch
docker build --platform=linux/amd64,linux/arm64 .

# how to login to oracle docker registry
https://cloud.oracle.com/registry/containers/
docker login sa-saopaulo-1.ocir.io



#Resources

https://stackoverflow.com/questions/72444103/what-does-running-the-multiarch-qemu-user-static-does-before-building-a-containe


https://docs.podman.io/en/latest/markdown/podman-build.1.html
## resources
https://docs.oracle.com/en-us/iaas/developer-tutorials/tutorials/tf-provider/01-summary.htm


#terraform part


Edited file ~/tf-provider/provider.tf


#  trying out to up the arm machine, following this github

https://github.com/stealthybox/tf-oci-arm/blob/main/compute.tf
