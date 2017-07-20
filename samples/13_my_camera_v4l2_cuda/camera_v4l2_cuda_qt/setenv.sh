
current_path=$(pwd)
export TEGRA_ARMABI=aarch64-linux-gnu
export DISPLAY=:0
cd /usr/lib/${TEGRA_ARMABI}
sudo ln -sf tegra-egl/libEGL.so.1 libEGL.so
sudo ln -sf tegra-egl/libGLESv2.so.2 libGLESv2.so
sudo ln -sf libv4l2.so.0 libv4l2.so
cd $current_path
