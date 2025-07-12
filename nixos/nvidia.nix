{ config, pkgs, ... }:

{
  hardware.graphics.enable = true;

  hardware.nvidia = {
    forceFullCompositionPipeline = true;
    modesetting.enable = true;
    powerManagement.enable = true;
    powerManagement.finegrained = false;
    open = false;
    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.production;
    prime = {
      sync.enable = true;
      nvidiaBusId = "PCI:1:0:0";
      amdgpuBusId = "PCI:5:0:0";
    };
    # NOTE: channel:unstable
    videoAcceleration = true;
    gsp.enable = true;
    nvidiaPersistenced = true;
  };

  hardware.nvidia-container-toolkit.enable = true;

  services.xserver.videoDrivers = [ "nvidia" ];

  services.hardware.openrgb = {
    enable = true;
    motherboard = "amd";
  };
}
