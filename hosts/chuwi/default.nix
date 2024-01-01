#
#  Specific system configuration settings for chuwi
#
#  flake.nix
#   ├─ ./hosts
#   │   ├─ default.nix
#   │   └─ ./chuwi
#   │        ├─ default.nix *
#   │        └─ hardware-configuration.nix
#   └─ ./modules
#       └─ ./desktops
#           └─ default.nix
#
#

{ pkgs, ... }:

{
  imports = [
              ./hardware-configuration.nix
            ];
            #] ++
            # ( import ../../modules/hardware/beelink) ++
            #( import ../../modules/desktops/virtualisation);

  boot = {
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

  networking.hostName = "chuwi";
  networking.hostId = "a7830edb";

  hardware = {
  };

  environment = {
    systemPackages = with pkgs; [               # System-Specific Packages
      # discord               # Messaging
    ];
  };

}
