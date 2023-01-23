#
#  Specific system configuration settings for desktop
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
#   │        └─ hardware.nix *
#   │
#   └─ ./modules
#       ├─ ./home-manager
#       │    ├─ direnv.nix
#       │    ├─ git.nix
#       │    ├─ starship.nix
#       │    └─ zsh.nix
#       │
#       ├─ ./android.nix
#       ├─ ./audio.nix
#       ├─ ./fonts.nix
#       ├─ ./gaming.nix
#       ├─ ./networking.nix
#       ├─ ./openrgb.nix
#       ├─ ./pantheon.nix
#       ├─ ./security.nix
#       ├─ ./services.nix
#       ├─ ./syncthing.nix
#       ├─ ./virtualisation.nix
#       ├─ ./vpn.nix
#       ├─ ./wine.nix
#       └─ ./xdg.nix

{ config, lib, pkgs, modulesPath, ... }:

{
  imports = [(modulesPath + "/installer/scan/not-detected.nix")];

  # Boot
  # https://search.nixos.org/options?channel=unstable&show=boot
  boot = {

    # Boot - Initrd
    # https://search.nixos.org/options?channel=unstable&show=boot.initrd
    initrd = {
      # Boot - Initrd - Available Kernel Modules 
      # https://search.nixos.org/options?channel=unstable&show=boot.initrd.availableKernelModules
      availableKernelModules = [ "xhci_pci" "ahci" "usbhid" "usb_storage" "sd_mod" ];

      # Boot - Initrd - Kernel Modules
      # https://search.nixos.org/options?channel=unstable&show=boot.initrd.kernelModules
      kernelModules = [ "amdgpu" ];

      # Boot - Initrd - Verbose
      # https://search.nixos.org/options?channel=unstable&show=boot.initrd.verbose
      verbose = false;
    };

    # Boot - Loader
    # https://search.nixos.org/options?channel=unstable&show=boot.loader
    loader = {
      
      # Boot - Loader - EFI
      # https://search.nixos.org/options?channel=unstable&show=boot.loader.efi
      efi = {

        # Boot - Loader - EFI - Allow installation process to modify EFI boot variables
        # https://search.nixos.org/options?channel=unstable&show=boot.loader.efi.canTouchEfiVariables
        canTouchEfiVariables = true;
        
        # Boot - Loader - EFI - Partition Mount Point
        # https://search.nixos.org/options?channel=unstable&show=boot.loader.efi.efiSysMountPoint
        efiSysMountPoint = "/boot/efi";
      };

      # Boot - Loader - EFI Boot Manager (systemd-boot)
      # https://search.nixos.org/options?channel=unstable&show=boot.loader.systemd-boot
      systemd-boot = {

        # Boot - Loader - EFI Boot Manager - Enable
        # https://search.nixos.org/options?channel=unstable&show=boot.loader.systemd-boot.enable
        enable = true;

        # Boot - Loader - EFI Boot Manager - Maximum Number Of Latest Generations Entries
        # https://search.nixos.org/options?channel=unstable&show=boot.loader.systemd-boot.configurationLimit
        configurationLimit = 5;
      };
    };

    # Boot - Plymouth
    # https://search.nixos.org/options?channel=unstable&show=boot.plymouth.enable
    plymouth.enable = true;

    # Boot - Console Logging Level
    # https://search.nixos.org/options?channel=unstable&show=boot.consoleLogLevel
    consoleLogLevel = 0;

    # Boot - Kernel Params
    # https://search.nixos.org/options?channel=unstable&show=boot.kernelParams
    kernelParams = [ 
      "quiet"
      "udev.log_level=3"
      "video=DP-1:2560x1440@120"
      "video=DP-2:2560x1440@120"
    ];

    # # Boot - Kernel Packages
    # https://search.nixos.org/options?channel=unstable&show=boot.kernelPackages
    kernelPackages = pkgs.linuxKernel.packages.linux_xanmod_latest;
    
    # Boot - Kernel Modules
    # https://search.nixos.org/options?channel=unstable&show=boot.kernelModules
    kernelModules = [ "kvm-amd" ];
    
    # Boot - Extra Module Packages
    # https://search.nixos.org/options?channel=unstable&show=boot.extraModulePackages
    extraModulePackages = [ ];
  };

  # Root Parition
  # https://search.nixos.org/options?channel=unstable&show=fileSystems
  fileSystems."/" = { 
    device = "/dev/disk/by-uuid/4e8f9cfc-9a2c-40e7-ad01-00a575e85c77";
    fsType = "ext4";
  };

  # ESP Partition
  # https://search.nixos.org/options?channel=unstable&show=fileSystems
  fileSystems."/boot/efi" = {
    device = "/dev/disk/by-uuid/140D-841F";
    fsType = "vfat";
  };

  # Swap Device(s) / Parition(s)
  # https://search.nixos.org/options?channel=unstable&show=swapDevices
  swapDevices = [{
    device = "/dev/disk/by-uuid/961d33dc-893a-4661-b8eb-77528d78f022";
  }];


  # Hardware
  # https://search.nixos.org/options?channel=unstable&show=hardware
  hardware = {

    # Hardware - Enable all the firmware with a license allowing redistribution.
    # https://search.nixos.org/options?channel=unstable&show=hardware.enableRedistributableFirmware
    enableRedistributableFirmware = true;

    # Hardware - CPU - AMD Microcode
    # https://search.nixos.org/options?channel=unstable&show=hardware.cpu.amd.updateMicrocode
    cpu.amd.updateMicrocode = lib.mkDefault true;

    # Video (high-resolution display)
    # https://search.nixos.org/options?channel=unstable&show=hardware.video.hidpi.enable
    video.hidpi.enable = lib.mkDefault true;

    # Hardware - Bluetooth
    bluetooth = {
      # Hardware - Bluetooth Enable
      # https://search.nixos.org/options?channel=unstable&show=hardware.bluetooth.enable
      enable = true;

      # Hardware - Bluetooth Package
      # https://search.nixos.org/options?channel=unstable&show=hardware.bluetooth.package
      package = pkgs.bluezFull;

      # Hardware - Bluetooth Power On The Controller At Boot
      # https://search.nixos.org/options?channel=unstable&show=hardware.bluetooth.powerOnBoot 
      powerOnBoot = true;

      # Hardware - Bluetooth Settings
      # https://search.nixos.org/options?channel=unstable&show=hardware.bluetooth.settings
      settings = {
        General = {
          Enable = "Source,Sink,Media,Socket";
        };
      };
    };

    # Hardware - OpenGL
    # https://search.nixos.org/options?channel=unstable&show=hardware.opengl
    opengl = {
      # OpenGL - Enable
      # https://search.nixos.org/options?channel=unstable&show=hardware.opengl.enable
      enable = true;
      
      # Hardware - OpenGL - Enable accelerated OpenGL rendering through the Direct Rendering Interface (DRI)
      # https://search.nixos.org/options?channel=unstable&show=hardware.opengl.driSupport
      driSupport = true;
      driSupport32Bit = true;

      # Hardware - OpenGL - Additional packages to add to OpenGL drivers.
      # https://search.nixos.org/options?channel=unstable&show=hardware.opengl.extraPackages
      extraPackages = with pkgs; [
        glxinfo
        mesa
        rocm-opencl-icd
        rocm-opencl-runtime
      ];

      # Hardware - OpenGL - Additional packages to add to 32-bit OpenGL drivers on 64-bit systems.
      # https://search.nixos.org/options?channel=unstable&show=hardware.opengl.extraPackages32
      # https://search.nixos.org/packages?channel=unstable&show=driversi686Linux
      extraPackages32 = with pkgs.driversi686Linux; [
        glxinfo
        mesa
      ];
    };

    # Hardware - Pulseaudio
    # https://search.nixos.org/options?channel=unstable&show=hardware.pulseaudio.enable
    pulseaudio = {

      # Hardware - Pulseaudio - Enable
      # https://search.nixos.org/options?channel=unstable&show=hardware.pulseaudio.enable
      enable = false;

      # Hardware - Pulseaudio - Support for 32-bit on 64-bit systems.
      # https://search.nixos.org/options?channel=unstable&show=hardware.pulseaudio.support32Bit
      support32Bit = true;

      # Hardware - Pulseaudio - Package
      # https://search.nixos.org/options?channel=unstable&show=hardware.pulseaudio.package
      package = pkgs.pulseaudioFull;
    };
  };
}
