# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, ... }:

{
  imports =
    [ 
      ./hardware-configuration.nix
    ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Use latest kernel.
  boot.kernelPackages = pkgs.linuxPackages_latest;

  networking.hostName = "hack";

  # Display Manager
  services.displayManager.ly.enable = true;

  # Allow unfree pkgs
  nixpkgs.config.allowUnfree = true;

  # Fix Swaylock??
  security.pam.services.swaylock = {};

  # Wayland
  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  # Configure network connections interactively with nmcli or nmtui.
  networking.networkmanager.enable = true;

  # Enable Bluetooth
  hardware.bluetooth.enable = true;

  # Upower
  services.upower.enable = true;

  # Power profile daemons
  services.power-profiles-daemon.enable = true;

  # Garbage Collect old generations
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 2d";
  };
  nix.settings.auto-optimise-store = true;

  # Set your time zone.
  time.timeZone = "America/Vancouver";

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Select internationalisation properties.
  # i18n.defaultLocale = "en_US.UTF-8";
  # console = {
  #   font = "Lat2-Terminus16";
  #   keyMap = "us";
  #   useXkbConfig = true; # use xkb.options in tty.
  # };

  # Enable the X11 windowing system.
  # services.xserver.enable = true;
  #services.xserver = {
  #  enable = true;
  #  windowManager.qtile.enable = true;
  #  displayManager.sessionCommands = ''
  #    xset r rate 200 35 &
  #  '';
  #};

  

  # Configure keymap in X11
  # services.xserver.xkb.layout = "us";
  # services.xserver.xkb.options = "eurosign:e,caps:escape";

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable sound.
  # services.pulseaudio.enable = true;
  # OR
#  services.pipewire = {
#    enable = true;
#    pulse.enable = true;
#  };
#
  # Enable touchpad support (enabled default in most desktopManager).
  services.libinput = {
    enable = true;
    touchpad.naturalScrolling = true;
  };


  # Define a user account. Don't forget to set a password with ‘passwd’.
   users.users.kle = {
     isNormalUser = true;
     extraGroups = [ "wheel" "networkmanager" ]; 
     packages = with pkgs; [
       tree
     ];
   };

  programs.firefox.enable = true;
  programs.mangowc.enable = true;

  # List packages installed in system profile.
  # You can use https://search.nixos.org/ to find more packages (and options).
   environment.systemPackages = with pkgs; [
     neovim 
     wget
     alacritty
     git
     fastfetch
     swaybg
     wmenu
     wl-clipboard
     grim
     slurp
     firefox
     discord
     waybar
     curl
     swaylock
     btop
     keepassxc
     localsend
     burpsuite
     eza
     zed-editor
     pcmanfm
     ffuf
     nmap
     python3
     posting
     john
     kiterunner
     seclists
     mitmproxy
     nikto
     sqlmap
     unfurl
     wpscan
     wireshark
     thc-hydra
     ettercap
     rustscan
     openvpn
     netcat
     inetutils
     brightnessctl
     username-anarchy
     arkenfox-userjs
     dig
     lf
   ];

   fonts.packages = with pkgs; [
     nerd-fonts.shure-tech-mono
   ];

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

  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  # system.copySystemConfiguration = true;

  # This option defines the first version of NixOS you have installed on this particular machine,
  # and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
  #
  # Most users should NEVER change this value after the initial install, for any reason,
  # even if you've upgraded your system to a new NixOS release.
  #
  # This value does NOT affect the Nixpkgs version your packages and OS are pulled from,
  # so changing it will NOT upgrade your system - see https://nixos.org/manual/nixos/stable/#sec-upgrading for how
  # to actually do that.
  #
  # This value being lower than the current NixOS release does NOT mean your system is
  # out of date, out of support, or vulnerable.
  #
  # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
  # and migrated your data accordingly.
  #
  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "26.05"; # Did you read the comment?

}

