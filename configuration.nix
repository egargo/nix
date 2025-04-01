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
	boot.loader.systemd-boot.enable = true;
	boot.loader.efi.canTouchEfiVariables = true;

	networking.hostName = "bee"; # Define your hostname.
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
		# pulseaudio.enable = false;

		# Enable touchpad support (enabled default in most desktopManager).
		libinput.enable = true;

		# Enable CUPS to print documents.
		printing.enable = true;
		avahi = {
			enable = true;
			nssmdns4 = true;
			openFirewall = true;
		};

		# Enable the X11 windowing system.
		xserver = {
			enable = true;

			# Enable the GNOME Desktop Environment.
			displayManager.gdm.enable = true;
			desktopManager.gnome.enable = true;
			excludePackages = with pkgs; [
				xterm
			];

			# NVIDIA
			videoDrivers = [ "nvidia" ];

			# Configure keymap in X11
			xkb = {
				layout = "us";
				variant = "";
			};
		};
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
		];

		systemPackages = with pkgs; [
			brave
			cargo rustc
			dbeaver-bin
			gcc
			ghostty
			git
			gnumake
			go
			lazydocker
			lazygit
			lua
			nodejs
			libreoffice
			netflix
			python313
			postman
			stow
			tmux
			vscode-fhs
			wget
		];

		variables.EDITOR = "nvim";
	};

	hardware = {
		graphics.enable = true;
		nvidia = {
			modesetting.enable = true;
			powerManagement.enable = true;
			powerManagement.finegrained = false;
			open = false;
			nvidiaSettings = true;
			prime = {
				offload = {
					enable = true;
					# enableOffloadCmd = true;
				};
				# sync.enable = true;
				amdgpuBusId = "PCI:5:0:0";
				nvidiaBusId = "PCI:1:0:0";
			};
			package = config.boot.kernelPackages.nvidiaPackages.latest;
		};
		nvidia-container-toolkit.enable = true;
		# channel:stable
		pulseaudio.enable = false;
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
				"wheel"
			];
			shell = pkgs.zsh;
			packages = with pkgs; [];
		};
	};

	fonts.packages = with pkgs; [
		# channel:stable
		(nerdfonts.override {
			fonts = [ "Iosevka" ];
		})

		# channel:unstable
		# nerd-fonts.iosevka
	];

	programs = {
		firefox.enable = true;
		fzf.fuzzyCompletion = true;
		neovim = {
			enable = true;
			defaultEditor = true;
			viAlias = true;
			vimAlias = true;
		};
		nix-ld.enable = true;
		starship.enable = true;
		ssh.startAgent = true;
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

	documentation.nixos.enable = true;
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
