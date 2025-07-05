{
  environment.variables.EDITOR = "nvim";

  environment.sessionVariables = {
    __NV_PRIME_RENDER_OFFLOAD = "1";
    __NV_PRIME_RENDER_OFFLOAD_PROVIDER = "NVIDIA-G0";
    __GLX_VENDOR_LIBRARY_NAME = "nvidia";
    __GLX_RENDERER = "nvidia";
    __VK_LAYER_NV_optimus = "NVIDIA_only";

    VDPAU_DRIVER="nvidia";
    DRI_PRIME="pci-0000_01_00_0";
    EGL_PLATFORM = "wayland";
    MOZ_DRM_DEVICE="/run/opengl-driver/lib/dri/nvidia_drv_video.so";
    GBM_BACKEND = "nvidia-drm";
    MOZ_DISABLE_RDD_SANDBOX = "1";
    WLR_NO_HARDWARE_CURSORS = "1";
    NVD_BACKEND = "direct";
    MUTTER_ALLOW_HYBRID_GPUS = "1";
    MOZ_ENABLE_WAYLAND = "1";
  };
}
