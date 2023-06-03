# Testing Yocto (Kirkstone) for RPi4
In order to build this Raspberry Pi distribution, you will need to have the following packages installed on your host:

* Docker (with daemon service running)

## Create Ubuntu 22.04 Docker image for build
```bash
# From the root of this repo
./docker/build-image.sh
```
**NOTE** : The default username created in this image corresponds to the username of the user invoking the `build-image.sh` script. Furthermore, the password for this user is its username as well.

You should now have a `yocto-kirkstone` docker image available. You can verify this with `docker images` command.

# Build the Yocto image
All the following command are ran from within `yocto-kirkstone` container.

### Running the `yocto-kirkstone` container
```bash
# From the root of this repo
docker run --rm --volume="$(pwd):$(pwd)" --workdir="$(pwd)" -it yocto-kirkstone:latest
```
* `--rm` Delete container when it exits
* `--volume` Maps the absolute path of the root of this repository to the same path within the container
* `--workdir` Start the container in the root of the repository
* `-it` Runs interactive shell

## Prepare the build environment (only has to be done once)
```bash
# From the root of this repo
./prepare-build-env.sh
```

## Building the image
```bash
# From the root of this repo
source poky/oe-init-build-env

# You should now be in the build folder, build the base image
bitbake core-image-base
```
