#sync rom
repo init --depth=1 --no-repo-verify -u https://github.com/NusantaraProject-ROM/android_manifest -b 10 -g default,-mips,-darwin,-notdefault
git clone https://github.com/yanzszs/local_manifest --depth 1 -b main .repo/local_manifests
repo sync -c --no-clone-bundle --no-tags --optimized-fetch --prune --force-sync -j8

# build rom
export NFS_TARGET_BUILD_ROM=NusantaraProject
source build/envsetup.sh
lunch nad_ginkgo-userdebug
export TZ=Asia/Jakarta
export KBUILD_BUILD_USER=zacky
export KBUILD_BUILD_HOST=nfsproject
export BUILD_USERNAME=zacky
export BUILD_HOSTNAME=nfsproject
mka nad -j8
# Fix Error
