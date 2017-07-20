
current_path=$(pwd)
export TEGRA_ARMABI=aarch64-linux-gnu
export DISPLAY=:0

cd /usr/lib/${TEGRA_ARMABI}
sudo ln -sf tegra-egl/libEGL.so.1 libEGL.so
sudo ln -sf tegra-egl/libGLESv2.so.2 libGLESv2.so
sudo ln -sf libv4l2.so.0 libv4l2.so
cd $current_path


# Internal flags
NVCCFLAGS=--shared
CPPFLAGS+=-fPIC

# Debug flags
# NVCCFLAGS += -g -G



ALL_CPPFLAGS="${ALL_CPPFLAGS} ${NVCCFLAGS}"

# Common includes and paths for CUDA
INCLUDES=-I"../../../../include"

# CUDA code generation flags
GENCODE_SM53=-gencode arch=compute_53,code=sm_53
GENCODE_SM62=-gencode arch=compute_62,code=sm_62
GENCODE_FLAGS="${GENCODE_SM53} ${GENCODE_SM62}"

export GENCODE_FLAGS
export NVCCFLAGS
export CPPFLAGS
export ALL_CPPFLAGS
export INCLUDES
export GENCODE_SM53
export GENCODE_SM62


