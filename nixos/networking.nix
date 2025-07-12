{
  networking.hostName = "bee";
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  networking.networkmanager.enable = true;

  time.timeZone = "Asia/Manila";

  # services.resolved = {
  #   enable = true;
  #   dnssec = "true";
  #   domains = [ "~." ];
  #   fallbackDns = [
  #     "1.1.1.3#one.one.one.one"
  #     "1.0.0.3#one.one.one.one"
  #     "2606:4700:4700::1113#one.one.one.one"
  #     "2606:4700:4700::1003#one.one.one.one"
  #   ];
  #   dnsovertls = "true";
  # };

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;
}
