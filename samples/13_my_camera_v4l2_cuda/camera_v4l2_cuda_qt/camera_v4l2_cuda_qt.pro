TEGRA_ARMABI = "aarch64-linux-gnu"

# Compile the cuda code
mytarget.target = /home/nvidia/tegra_multimedia_api/samples/common/algorithm/cuda/NvAnalysis.o
mytarget.commands = @make -C /home/nvidia/tegra_multimedia_api/samples/common/algorithm/cuda
mytarget.depends = mytarget2
mytarget2.commands = @echo "Chongde custom:  Building $$mytarget.target"

QMAKE_EXTRA_TARGETS += mytarget mytarget2





TEMPLATE = app

CONFIG += console c++11
CONFIG -= app_bundle
CONFIG -= qt


SOURCES += \
    camera_v4l2_cuda.cpp \
    ../../common/classes/*.cpp \



HEADERS += \
    camera_v4l2_cuda.h \
    /home/nvidia/tegra_multimedia_api/samples/common/algorithm/*.h \
    /home/nvidia/tegra_multimedia_api/samples/common/algorithm/cuda/*.h \


INCLUDEPATH += \
    /home/nvidia/tegra_multimedia_api/include \
    /home/nvidia/tegra_multimedia_api/samples/common/algorithm/cuda \
    /home/nvidia/tegra_multimedia_api/samples/common/algorithm \
    /usr/local/cuda/targets/aarch64-linux/include \
    /usr/include/aarch64-linux-gnu \
    /home/nvidia/tegra_multimedia_api/include/libjpeg-8b \





LIBS += \
    -L/usr/local/cuda/targets/aarch64-linux/lib \
    -L/usr/lib/aarch64-linux-gnu/tegra \
    -L/lib/aarch64-linux-gnu/ \
    -L/usr/lib/aarch64-linux-gnu/ \
    -lpthread \
    -lv4l2 \
    -lEGL \
    -lGLESv2 \
    -lX11 \
    -lnvbuf_utils \
    -lnvjpeg \
    -lcuda \
    -lcudart \
    -lnvsample_cudaprocess \


OBJECTS += \
        #  This twp file can not been compiled with gcc, it is compiled with nvcc
        /home/nvidia/tegra_multimedia_api/samples/common/algorithm/cuda/NvAnalysis.o \
        /home/nvidia/tegra_multimedia_api/samples/common/algorithm/cuda/NvCudaProc.o







