#
#  Specific system XDG configuration settings module
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
#       ├─ ./video.nix
#       ├─ ./virtualisation.nix *
#       ├─ ./syncthing.nix
#       ├─ ./vpn.nix
#       ├─ ./wine.nix
#       └─ ./xdg.nix

{ config, lib, pkgs, ... }:

{
  # Virtualisation
  # https://search.nixos.org/options?channel=nixos-23.05&show=virtualisation
  virtualisation = {

    # Virtualisation - Docker - Rootless
    # https://search.nixos.org/options?channel=nixos-23.05&show=virtualisation.docker.rootless
    docker.rootless = {

      # Virtualisation - Docker - Rootless - Enable
      # https://search.nixos.org/options?channel=nixos-23.05&show=virtualisation.docker.rootless
      enable = true;

      # Virtualisation - Docker - Rootless - Set Socket Variable
      # https://search.nixos.org/options?channel=nixos-23.05&show=virtualisation.docker.rootless
      setSocketVariable = true;

      # Docker - Rootless - Daemon Settings
      # https://search.nixos.org/options?channel=nixos-23.05&show=virtualisation.docker.rootless.daemon.settings
      daemon.settings = {
        group = "docker";
        ip    = "127.0.0.1";
      };
    };

    # Virtualization - Libvirtd
    # https://search.nixos.org/options?channel=nixos-23.05&show=virtualisation.libvirtd
    libvirtd = {
      # Virtualization - Libvirtd - Enable
      # https://search.nixos.org/options?channel=nixos-23.05&show=virtualisation.libvirtd.enable 
      enable = true;

      # Virtualization - Libvirtd - QEMU
      # https://search.nixos.org/options?channel=nixos-23.05&show=virtualisation.libvirtd.qemu
      qemu = {
        # Virtualization - Libvirtd - QEMU - Package
        # https://search.nixos.org/options?channel=nixos-23.05&show=virtualisation.libvirtd.qemu.package
        package = pkgs.qemu_kvm;

        # Virtualization - Libvirtd - QEMU - SWTPM
        # https://search.nixos.org/options?channel=nixos-23.05&show=virtualisation.libvirtd.qemu.swtpm
        swtpm.enable = true;
        
        # Virtualization - Libvirtd - QEMU - OVMF
        # https://search.nixos.org/options?channel=nixos-23.05&show=virtualisation.libvirtd.qemu.ovmf
        ovmf = {
          # Virtualization - Libvirtd - QEMU - OVMF - Enable
          # https://search.nixos.org/options?channel=nixos-23.05&show=virtualisation.libvirtd.qemu.ovmf.enable
          enable =  true;

          # Virtualization - Libvirtd - QEMU - OVMF - Packages
          # https://search.nixos.org/options?channel=nixos-23.05&show=virtualisation.libvirtd.qemu.ovmf.packages
          packages = with pkgs; [ OVMFFull.fd ];
        };
      };
    };
    
    # LXD / LXC
    # lxd = {
    #   enable = true;
    # };
  };
}
