# sync rom
repo init --depth=1 --no-repo-verify -u https://github.com/RiceDroid/android -b thirteen -g default,-mips,-darwin,-notdefault
git clone https://github.com/Tiktodz/local_manifest --depth 1 -b rice .repo/local_manifests
repo sync -c --no-clone-bundle --no-tags --optimized-fetch --prune --force-sync -j8

# build rom
. build/envsetup.sh
lunch lineage_X00TD-userdebug
export TZ=Asia/Jakarta
#export ALLOW_MISSING_DEPENDENCIES=true
#export SELINUX_IGNORE_NEVERALLOWS=true
mka bacon
# end
