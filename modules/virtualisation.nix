#
#  Specific system Virtualisation configuration settings module
#
#  flake.nix
#   ├─ ./darwin
#   │   ├─ ./configuration.nix
#   │   ├─ ./default.nix
#   │   └─ ./home.nix
#   │
#   ├─ ./hosts
#   │   ├─ ./default.nix
#   │   ├─ ./home.nix
#   │   └─ ./desktop
#   │        ├─ default.nix
#   │        └─ hardware.nix
#   │
#   └─ ./modules
#       ├─ ./home-manager
#       │    ├─ direnv.nix
#       │    ├─ git.nix
#       │    ├─ starship.nix
#       │    ├─ vscode.nix
#       │    └─ zsh.nix
#       │
#       ├─ ./android.nix
#       ├─ ./audio.nix
#       ├─ ./fonts.nix
#       ├─ ./gaming.nix
#       ├─ ./homeassistant.nix
#       ├─ ./networking.nix
#       ├─ ./pantheon.nix
#       ├─ ./security.nix
#       ├─ ./services.nix
#       ├─ ./virtualisation.nix *
#       ├─ ./syncthing.nix
#       └─ ./vpn.nix

{ config, lib, pkgs, ... }:

{
  # Virtualisation
  # https://search.nixos.org/options?channel=unstable&show=virtualisation
  virtualisation = {

    # Virtualisation - Docker - Rootless
    # https://search.nixos.org/options?channel=unstable&show=virtualisation.docker.rootless
    docker.rootless = {

      # Virtualisation - Docker - Rootless - Enable
      # https://search.nixos.org/options?channel=unstable&show=virtualisation.docker.rootless
      enable = true;

      # Virtualisation - Docker - Rootless - Set Socket Variable
      # https://search.nixos.org/options?channel=unstable&show=virtualisation.docker.rootless
      setSocketVariable = true;

      # Virtualisation - Docker - Rootless - Daemon Settings
      # https://search.nixos.org/options?channel=unstable&show=virtualisation.docker.rootless.daemon.settings
      daemon.settings = {
        group = "docker";
        ip    = "127.0.0.1";
      };
    };

    # Virtualisation - Libvirtd
    # https://search.nixos.org/options?channel=unstable&show=virtualisation.libvirtd
    libvirtd = {
      # Virtualisation - Libvirtd - Enable
      # https://search.nixos.org/options?channel=unstable&show=virtualisation.libvirtd.enable 
      enable = true;

      # Virtualisation - Libvirtd - QEMU
      # https://search.nixos.org/options?channel=unstable&show=virtualisation.libvirtd.qemu
      qemu = {
        # Virtualisation - Libvirtd - QEMU - Package
        # https://search.nixos.org/options?channel=unstable&show=virtualisation.libvirtd.qemu.package
        package = pkgs.qemu_kvm;

        # Virtualisation - Libvirtd - QEMU - SWTPM
        # https://search.nixos.org/options?channel=unstable&show=virtualisation.libvirtd.qemu.swtpm
        swtpm.enable = true;
        
        # Virtualisation - Libvirtd - QEMU - OVMF
        # https://search.nixos.org/options?channel=unstable&show=virtualisation.libvirtd.qemu.ovmf
        ovmf = {
          # Virtualisation - Libvirtd - QEMU - OVMF - Enable
          # https://search.nixos.org/options?channel=unstable&show=virtualisation.libvirtd.qemu.ovmf.enable
          enable =  true;

          # Virtualisation - Libvirtd - QEMU - OVMF - Packages
          # https://search.nixos.org/options?channel=unstable&show=virtualisation.libvirtd.qemu.ovmf.packages
          packages = with pkgs; [ OVMFFull.fd ];
        };
      };
    };
  };
}
