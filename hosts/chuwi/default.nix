#
#  Specific system configuration settings for beelink
#
#  flake.nix
#   ├─ ./hosts
#   │   ├─ default.nix
#   │   └─ ./beelink
#   │        ├─ default.nix *
#   │        └─ hardware-configuration.nix
#   └─ ./modules
#       └─ ./desktops
#           ├─ hyprland.nix
#           └─ ./virtualisation
#               └─ default.nix
#
#  NOTE: Dual booted with windows 11. Disable fast-boot in power plan and bios and turn off hibernate to get wifi and bluetooth working. This only works once but on reboot is borked again. So using the old school BLT dongle.
#

{ pkgs, ... }:

{
  imports = [
              ./hardware-configuration.nix
              # ../../modules/programs/games.nix
            ] ++
            ( import ../../modules/hardware/beelink) ++
            ( import ../../modules/desktops/virtualisation);

  boot = {                                      # Boot Options
    loader = {
      systemd-boot = {
        enable = true;
        configurationLimit = 3;
      };
      efi = {
        canTouchEfiVariables = true;
      };
      timeout = 5;
    };
    kernelPackages = pkgs.linuxPackages_latest;
  };

  networking.hostId = "a7830edb"

  hardware = {
  #   opengl = {                                  # Hardware Accelerated Video
  #     enable = true;
  #     extraPackages = with pkgs; [
  #       intel-media-driver
  #       vaapiIntel
  #       vaapiVdpau
  #       libvdpau-va-gl
  #     ];
  #   };
  #   sane = {                                    # Scanning
  #     enable = true;
  #     extraBackends = [ pkgs.sane-airscan ];
  #   };
  };

  # hyprland.enable = true;                       # Window Manager

  environment = {
    systemPackages = with pkgs; [               # System-Wide Packages
      # discord               # Messaging
      # gimp                  # Image Editor
      # gmtp                  # Mount GoPro
      # jellyfin-media-player # Media Player
      # obs-studio            # Live Streaming
      # plex-media-player     # Media Player
      # rclone                # Gdrive ($ rclone config | rclone mount --daemon gdrive:<path> <host/path>)
      # simple-scan           # Scanning
      # moonlight-qt          # Remote Streaming
    ];
  };

}
