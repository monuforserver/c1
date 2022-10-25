# sync rom
repo init --depth=1 --no-repo-verify -u https://github.com/SuperiorOS/manifest.git -b thirteen -g default,-mips,-darwin,-notdefault
git clone https://github.com/Tiktodz/local_manifest --depth 1 -b sup .repo/local_manifests
repo sync -c --no-clone-bundle --no-tags --optimized-fetch --prune --force-sync -j8

# build rom
source build/envsetup.sh
lunch superior_X00TD-userdebug
export TZ=Asia/Shanghai
#export ALLOW_MISSING_DEPENDENCIES=true
#export SELINUX_IGNORE_NEVERALLOWS=true
m bacon -j8
# end
