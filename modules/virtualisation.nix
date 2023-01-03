#
#  Specific system XDG configuration settings module
#
#  flake.nix
#   ├─ ./hosts
#   │   ├─ ./default.nix
#   │   ├─ ./home.nix
#   │   └─ ./desktop
#   │        ├─ default.nix
#   │        └─ hardware.nix
#   └─ ./modules
#       ├─ ./audio.nix
#       ├─ ./fonts.nix
#       ├─ ./networking.nix
#       ├─ ./pantheon.nix
#       ├─ ./programs.nix
#       ├─ ./security.nix
#       ├─ ./services.nix
#       ├─ ./virtualisation.nix *
#       ├─ ./vpn.nix
#       └─ ./xdg.nix

{ config, lib, pkgs, ... }:

{
  # Virtualisation
  virtualisation = {
    # Docker (Rootless - Works similar to Podman)
    docker.rootless = {
      enable = true;
      setSocketVariable = true;
    };

    # Libvirt (KVM / QEMU)
    libvirtd = {
      enable = true;
      qemu = {
        swtpm.enable = true;
        ovmf.enable =  true;
      };
    };
  };
}
