{
  virtualisation.docker = {
    rootless = {
      enable = true;
      setSocketVariable = true;
    };
  };

  programs.virt-manager.enable = true;
  users.groups.libvirtd.members = [ "clint" ];
  users.users.clint.extraGroups = [ "libvirtd" ];
  virtualisation = {
    libvirtd.enable = true;
    spiceUSBRedirection.enable = true;
  };
  services = {
    qemuGuest.enable = true;
    spice-vdagentd.enable = true;
  };
}
