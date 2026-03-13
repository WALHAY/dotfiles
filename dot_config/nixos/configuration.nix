{ config, pkgs, ... }:

{
  imports = [ ./hardware-configuration.nix <home-manager/nixos> ]; 

  home-manager.users.walhay = import /home/walhay/.config/home-manager/home.nix;

  # Bootloader (system only)
  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
    timeout = 25;
  };

  # XServer keyboard (system service)
  services.xserver = {
    xkb = {
      layout = "us, ru";
      options = "caps:escape";
    };
    videoDrivers = [ "nvidia" ];
  };

  hardware.opengl = {
    enable = true;
    driSupport32Bit = true;
  };

  hardware.nvidia = {
    open = true;
    modesetting.enable = true;
    package = config.boot.kernelPackages.nvidiaPackages.stable;
    nvidiaSettings = true;
  };

  # Networking (system service)
  networking.hostName = "nixos";
  networking.networkmanager.enable = true;

  # Timezone (system-wide)
  time.timeZone = "Europe/Moscow";

  # Locale (system-wide)
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
        LC_NUMERIC = "ru_RU.UTF-8";
        LC_TIME = "ru_RU.UTF-8";
        LC_MONETARY = "ru_RU.UTF-8";
        LC_ADDRESS = "ru_RU.UTF-8";
        LC_IDENTIFICATION = "ru_RU.UTF-8";
        LC_MEASUREMENT = "ru_RU.UTF-8";
        LC_PAPER = "ru_RU.UTF-8";
        LC_TELEPHONE = "ru_RU.UTF-8";
        LC_NAME = "ru_RU.UTF-8";
        LANG = "en_US.UTF-8";
  };

  # User account definition (system users)
  users.users.walhay = {
    isNormalUser = true;
    description = "WALHAY";
    extraGroups = [ "networkmanager" "wheel" ];
    shell = pkgs.zsh;
  };

  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
  };

  programs.zsh.enable = true;
  users.defaultUserShell = pkgs.zsh;
  environment.shells = [ pkgs.zsh ];

  # Unfree packages (global)
  nixpkgs.config.allowUnfree = true;

  # System compositor
  programs.niri.enable = true;

  # SYSTEM PACKAGES (minimal - only shared/system-wide)
  environment.systemPackages = with pkgs; [
    xwayland  # XWayland needed system-wide
    # Remove user apps: neovim, fuzzel, etc.
  ];

  system.stateVersion = "25.11";
}
