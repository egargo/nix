# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
	imports = [
		# Include the results of the hardware scan.
		./hardware-configuration.nix
	];

	# Bootloader.
	boot = {
		loader = {
			systemd-boot.enable = true;
			efi.canTouchEfiVariables = true;
		};
	};

	networking.hostName = "bee";
	# networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

	# Configure network proxy if necessary
	# networking.proxy.default = "http://user:password@proxy:port/";
	# networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

	# Enable networking
	networking.networkmanager.enable = true;

	# Set your time zone.
	time.timeZone = "Asia/Manila";

	# Select internationalisation properties.
	i18n = {
		defaultLocale = "en_US.UTF-8";
		extraLocaleSettings = {
			LC_ADDRESS = "en_US.UTF-8";
			LC_IDENTIFICATION = "en_US.UTF-8";
			LC_MEASUREMENT = "en_US.UTF-8";
			LC_MONETARY = "en_US.UTF-8";
			LC_NAME = "en_US.UTF-8";
			LC_NUMERIC = "en_US.UTF-8";
			LC_PAPER = "en_US.UTF-8";
			LC_TELEPHONE = "en_US.UTF-8";
			LC_TIME = "en_US.UTF-8";
		};
	};

	services = {
		# Flatpak
		# flatpak.enable = true;

		# Display manager.
		displayManager.defaultSession = "gnome";

		# Enable sound.
		pipewire = {
			enable = true;
			alsa.enable = true;
			alsa.support32Bit = true;
			pulse.enable = true;
			jack.enable = true;

			# use the example session manager (no others are packaged yet so this is enabled by default,
			# no need to redefine it in your config for now)
			#media-session.enable = true;
		};

		# channel:unstable
		pulseaudio.enable = false;

		# Enable touchpad support (enabled default in most desktopManager).
		libinput.enable = true;

		# Enable CUPS to print documents.
		printing.enable = true;
		avahi = {
			enable = true;
			nssmdns4 = true;
			openFirewall = true;
		};

		# resolved = {
		# 	enable = true;
		# 	dnssec = "true";
		# 	domains = [ "~." ];
		# 	fallbackDns = [
		# 		"1.1.1.3#one.one.one.one"
		# 		"1.0.0.3#one.one.one.one"
		# 		"2606:4700:4700::1113#one.one.one.one"
		# 		"2606:4700:4700::1003#one.one.one.one"
		# 	];
		# 	dnsovertls = "true";
		# };

		# Enable the X11 windowing system.
		xserver = {
			enable = true;
			displayManager.gdm.enable = true;
			desktopManager.gnome.enable = true;
			excludePackages = with pkgs; [ xterm ];
			videoDrivers = [ "nvidia" ];
			xkb = {
				layout = "us";
				variant = "";
			};
		};

		hardware.openrgb = {
			enable = true;
			motherboard = "amd";
		};

		teamviewer.enable = true;
	};

	environment = {
		gnome.excludePackages = with pkgs; [
			epiphany
			geary
			gnome-connections
			gnome-contacts
			gnome-console
			gnome-font-viewer
			gnome-logs
			gnome-maps
			gnome-music
			gnome-photos
			gnome-software
			gnome-tour
			gnome-weather
			seahorse
			totem
			yelp
		];

		systemPackages = with pkgs; [
			brave
			cargo rustc
			dbeaver-bin
			gcc
			ghostty
			gimp
			gnumake
			go
			lazydocker
			lua
			nodejs
			libreoffice
			netflix
			python313
			postman
			qbittorrent
			stow
			vscode-fhs
			wget
		];

		variables.EDITOR = "nvim";

		sessionVariables = {
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
	};

	hardware = {
		bluetooth = {
			enable = true;
			powerOnBoot = false;
			settings = {
				General = {
					Experimental = false;
				};
			};
		};
		graphics = {
			enable = true;
			extraPackages = with pkgs; [
				nvidia-vaapi-driver
			];
		};
		nvidia = {
			forceFullCompositionPipeline = true;
			modesetting.enable = true;
			powerManagement.enable = true;
			powerManagement.finegrained = false;
			open = false;
			nvidiaSettings = true;
			package = config.boot.kernelPackages.nvidiaPackages.production;
			prime = {
				# offload = {
				# 	enable = true;
				# 	enableOffloadCmd = true;
				# };
				sync.enable = true;
				nvidiaBusId = "PCI:1:0:0";
				amdgpuBusId = "PCI:5:0:0";
			};
			# channel:unstable
			videoAcceleration = true;
			gsp.enable = true;
			nvidiaPersistenced = true;
		};
		nvidia-container-toolkit.enable = true;
		# channel:stable
		# pulseaudio = {
		# 	enable = false;
		# 	package = with pkgs; [ pulseaudioFull ];
		# };
	};

	powerManagement.enable = true;

	security.rtkit.enable = true;

	# Define a user account. Don't forget to set a password with ‘passwd’.
	users = {
		defaultUserShell = pkgs.zsh;
		users.clint = {
			isNormalUser = true;
			home = "/home/clint";
			description = "Clint";
			extraGroups = [
				"docker"
				"jackaudio"
				"networkmanager"
				"video"
				"wheel"
			];
			shell = pkgs.zsh;
			packages = with pkgs; [];
		};
	};

	fonts.packages = with pkgs; [
		# channel:stable
		# (nerdfonts.override {
		# 	fonts = [ "Iosevka" ];
		# })

		# channel:unstable
		nerd-fonts.iosevka
	];

	programs = {
		firefox = {
			enable = true;
			preferences = {
				"media.ffmpeg.vaapi.enabled" = true;
				"media.av1.enabled" = false;
				"media.hardware-video-decoding.force-enabled" = true;
				"widget.wayland.opaque-region.enabled" = false;
			};
		};
		fzf.fuzzyCompletion = true;
		git.enable = true;
		lazygit.enable = true;
		neovim = {
			enable = true;
			defaultEditor = true;
			viAlias = true;
			vimAlias = true;
		};
		nix-ld.enable = true;
		ssh.startAgent = true;
		starship.enable = true;
		tmux = {
			enable = true;
			keyMode = "vi";
			shortcut = "Space";
			terminal = "screen-256color";
		};
		zsh = {
			enable = true;
			enableCompletion = true;
			ohMyZsh = {
				enable = true;
				plugins = [
					"command-not-found"
					"docker"
					"fzf"
					"git"
					"git-prompt"
					"gitignore"
					"golang"
					"rust"
					"safe-paste"
					"shrink-path"
					"vi-mode"
					"zsh-interactive-cd"
					"zsh-navigation-tools"
				];
				theme = "robbyrussell";
			};
			syntaxHighlighting.enable = true;
			autosuggestions.enable = true;
		};
	};

	# channel:unstable
	# systemd.services = {
	# 	"getty@tty1".enable = false;
	# 	"autovt@tty1".enable = false;
	# };

	virtualisation.docker.rootless = {
		enable = true;
		setSocketVariable = true;
	};

	# documentation.nixos.enable = true;
	nix = {
		gc = {
			automatic = true;
			dates = "daily";
			options = "--delete-older-than 7d";
		};
		settings = {
			auto-optimise-store = true;
			experimental-features = [ "nix-command" "flakes" ];
		};
	};

	# Allow unfree packages
	nixpkgs.config.allowUnfree = true;

	# Some programs need SUID wrappers, can be configured further or are
	# started in user sessions.
	# programs.mtr.enable = true;
	# programs.gnupg.agent = {
	#   enable = true;
	#   enableSSHSupport = true;
	# };

	# List services that you want to enable:

	# Enable the OpenSSH daemon.
	# services.openssh.enable = true;

	# Open ports in the firewall.
	# networking.firewall.allowedTCPPorts = [ ... ];
	# networking.firewall.allowedUDPPorts = [ ... ];
	# Or disable the firewall altogether.
	# networking.firewall.enable = false;

	# This value determines the NixOS release from which the default
	# settings for stateful data, like file locations and database versions
	# on your system were taken. It‘s perfectly fine and recommended to leave
	# this value at the release version of the first install of this system.
	# Before changing this value read the documentation for this option
	# (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
	system.stateVersion = "24.11"; # Did you read the comment?

}
