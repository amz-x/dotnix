#
#  Specific system Virtualisation configuration settings module
#

{ config, lib, pkgs, ... }:

{
  # Virtualisation
  # https://search.nixos.org/options?channel=unstable&show=virtualisation
  virtualisation = {
    
    # Podman
    # https://search.nixos.org/options?channel=unstable&show=virtualisation.podman
    podman = {
      
      # Podman - Enable
      # https://search.nixos.org/options?channel=23.05&show=virtualisation.podman.enable
      enable = false;
      
      # Podman - Auto Prune
      # https://search.nixos.org/options?channel=23.05&show=virtualisation.podman.autoPrune
      autoPrune = {
        
        # Podman - Auto Prune - Enable
        # https://search.nixos.org/options?channel=23.05&show=virtualisation.podman.autoPrune.enable
        enable = true;
        
        # Podman - Auto Prune - Dates
        # https://search.nixos.org/options?channel=23.05&show=virtualisation.podman.autoPrune.dates
        dates = "daily";
        
        # Podman - Auto Prune - Flags
        # https://search.nixos.org/options?channel=23.05&show=virtualisation.podman.autoPrune.flags
        flags = [ "--all" ];
      };
      
      # Podman - Docker Compatibility
      # https://search.nixos.org/options?channel=23.05&show=virtualisation.podman.dockerCompat
      dockerCompat = true;
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
