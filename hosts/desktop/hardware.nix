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
#       │    ├─ vscode.nix
#       │    └─ zsh.nix
#       │
#       ├─ ./android.nix
#       ├─ ./audio.nix
#       ├─ ./fonts.nix
#       ├─ ./gaming.nix
#       ├─ ./networking.nix
#       ├─ ./pantheon.nix
#       ├─ ./security.nix
#       ├─ ./services.nix
#       ├─ ./syncthing.nix
#       ├─ ./video.nix
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
    
    # Boot - Bootspec
    bootspec.enable = true;

    # Boot - Loader
    # https://search.nixos.org/options?channel=unstable&show=boot.loader
    loader = {
      # Systemd Boot
      systemd-boot = {
        enable = true;
        configurationLimit = 5;
      };

      # Boot - Loader - EFI
      # https://search.nixos.org/options?channel=unstable&show=boot.loader.efi
      efi = {

        # Boot - Loader - EFI - Allow installation process to modify EFI boot variables
        # https://search.nixos.org/options?channel=unstable&show=boot.loader.efi.canTouchEfiVariables
        canTouchEfiVariables = true;

        # Boot - Loader - EFI - Partition Mount Point
        # https://search.nixos.org/options?channel=unstable&show=boot.loader.efi.efiSysMountPoint
        efiSysMountPoint = "/boot";
        
      };

     
    };

    # Boot - Kernel
    # https://search.nixos.org/options?channel=unstable&show=boot.kernel
    kernel = {
      # Boot - Kernel - Enable
      # https://search.nixos.org/options?channel=unstable&show=boot.kernel.enable
      enable = true;

      # Boot - Kernel - Sysctl
      # https://search.nixos.org/options?channel=unstable&show=boot.kernel.sysctl
      sysctl = { "vm.swappiness" = 10; };
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
    kernelPackages = pkgs.linuxKernel.packages.linux_zen;

    # Boot - Kernel Modules
    # https://search.nixos.org/options?channel=unstable&show=boot.kernelModules
    kernelModules = [ "kvm-amd" ];

    # Boot - Extra Module Packages
    # https://search.nixos.org/options?channel=unstable&show=boot.extraModulePackages
    extraModulePackages = [ ];

    # Boot - Temporary Directory
    # https://search.nixos.org/options?channel=unstable&show=boot.tmp
    tmp = {
      # Boot - Temporary Directory - Clean On Boot
      # https://search.nixos.org/options?channel=unstable&show=boot.tmp.cleanOnBoot
      cleanOnBoot = true;
    };
  };

  # Root Parition
  # https://search.nixos.org/options?channel=unstable&show=fileSystems
  fileSystems."/" = { 
    device = "/dev/disk/by-uuid/93240c10-521a-4016-a3b6-8c9c66af7f11";
    fsType = "ext4";
  };

  # ESP Partition
  # https://search.nixos.org/options?channel=unstable&show=fileSystems
  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/61A0-B73C";
    fsType = "vfat";
  };

  # Swap Device(s) / Parition(s)
  # https://search.nixos.org/options?channel=unstable&show=swapDevices
  swapDevices = [{
    device = "/dev/disk/by-uuid/fd3b8dd5-5475-4e8d-8406-3c027850cce2";
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

    # Hardware - Bluetooth
    # https://search.nixos.org/options?channel=unstable&show=hardware.bluetooth
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
        rocm-opencl-icd
        rocm-opencl-runtime
        libva
        libva-utils
      ];

      # Hardware - OpenGL - Additional packages to add to 32-bit OpenGL drivers on 64-bit systems.
      # https://search.nixos.org/options?channel=unstable&show=hardware.opengl.extraPackages32
      # https://search.nixos.org/packages?channel=unstable&show=driversi686Linux
      extraPackages32 = with pkgs.driversi686Linux; [
        glxinfo
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
