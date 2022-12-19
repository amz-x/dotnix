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
