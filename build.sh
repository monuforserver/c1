# sync rom
repo init --depth=1 --no-repo-verify -u https://github.com/Corvus-AOSP/android_manifest.git -b 13 -g default,-mips,-darwin,-notdefault
git clone https://github.com/Tiktodz/local_manifest --depth 1 -b corvus .repo/local_manifests
repo sync -c --no-clone-bundle --no-tags --optimized-fetch --prune --force-sync -j8

# build rom
source build/envsetup.sh
lunch corvus_X00TD-userdebug
export TZ=Asia/Jakarta
#export ALLOW_MISSING_DEPENDENCIES=true
#export SELINUX_IGNORE_NEVERALLOWS=true
make corvus -j8
# end
