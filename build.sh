#sync rom
repo init --depth=1 --no-repo-verify -u https://github.com/RiceDroid/android -b thirteen -g default,-mips,-darwin,-notdefault
git clone https://github.com/yanzszs/local_manifest --depth 1 -b whyred-13 .repo/local_manifests
repo sync -c --no-clone-bundle --no-tags --optimized-fetch --prune --force-sync -j8

# build rom
export NFS_TARGET_BUILD_ROM=RiceDroid
source build/envsetup.sh
lunch lineage_whyred-userdebug
export TZ=Asia/Jakarta
export ALLOW_MISSING_DEPENDENCIES=true
export KBUILD_BUILD_USER=zacky
export KBUILD_BUILD_HOST=NFS-Project
export BUILD_USERNAME=zacky
export BUILD_HOSTNAME=NFS-Project
mka bacon -j8
# Build RiceDroid Thirteen Vanilla
