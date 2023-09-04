#
#  Specific system configuration settings for desktop
#

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
      availableKernelModules = [ "xhci_pci" "nvme" "usb_storage" "sd_mod" ];

      # Boot - Initrd - Kernel Modules
      # https://search.nixos.org/options?channel=unstable&show=boot.initrd.kernelModules
      kernelModules = [ "i915" ]; 

      # Boot - Initrd - Verbose
      # https://search.nixos.org/options?channel=unstable&show=boot.initrd.verbose
      verbose = false;
    };
    
    # Boot - Bootspec
    # https://search.nixos.org/options?channel=unstable&show=boot.bootspec
    bootspec.enable = true;
    
    # # Boot - Secure Boot (Lanzaboote)
    # lanzaboote = {
    #   enable = true;
    #   pkiBundle = "/etc/secureboot";
    # };

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
      enable = lib.mkDefault true;

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
    ];

    # # Boot - Kernel Packages
    # https://search.nixos.org/options?channel=unstable&show=boot.kernelPackages
    kernelPackages = pkgs.linuxKernel.packages.linux_6_4;

    # Boot - Kernel Modules
    # https://search.nixos.org/options?channel=unstable&show=boot.kernelModules
    kernelModules = [ "kvm-intel" ];

    # Boot - Extra Module Packages
    # https://search.nixos.org/options?channel=unstable&show=boot.extraModulePackages
    extraModulePackages = [ ];

    # Boot - Temporary Directory
    # https://search.nixos.org/options?channel=unstable&show=boot.tmp
    tmp = {
      # Boot - Temporary Directory - Clean On Boot
      # https://search.nixos.org/options?channel=unstable&show=boot.tmp.cleanOnBoot
      cleanOnBoot = lib.mkDefault true;
    };
  };

  # Root Parition
  # https://search.nixos.org/options?channel=unstable&show=fileSystems
  fileSystems."/" = { 
    #device = "/dev/disk/by-uuid/xxxx";
    fsType = "ext4";
  };

  # ESP Partition
  # https://search.nixos.org/options?channel=unstable&show=fileSystems
  fileSystems."/boot" = {
    #device = "/dev/disk/by-uuid/xxxx";
    fsType = "vfat";
  };

  # Swap Device(s) / Parition(s)
  # https://search.nixos.org/options?channel=unstable&show=swapDevices
  swapDevices = [{
    # device = "/dev/disk/by-uuid/xxxx";
  }];


  # Hardware
  # https://search.nixos.org/options?channel=unstable&show=hardware
  hardware = {

    # Hardware - Enable all the firmware with a license allowing redistribution.
    # https://search.nixos.org/options?channel=unstable&show=hardware.enableRedistributableFirmware
    enableRedistributableFirmware = lib.mkDefault true;

    # Hardware - CPU - Intel Microcode
    # https://search.nixos.org/options?channel=unstable&show=hardware.cpu.intel.updateMicrocode
    cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;

    # Hardware - Bluetooth
    # https://search.nixos.org/options?channel=unstable&show=hardware.bluetooth
    bluetooth = {

      # Hardware - Bluetooth Enable
      # https://search.nixos.org/options?channel=unstable&show=hardware.bluetooth.enable
      enable = lib.mkDefault true;

      # Hardware - Bluetooth Package
      # https://search.nixos.org/options?channel=unstable&show=hardware.bluetooth.package
      package = pkgs.bluezFull;

      # Hardware - Bluetooth Power Up The Default Controller On Boot
      # https://search.nixos.org/options?channel=unstable&show=hardware.bluetooth.powerOnBoot 
      powerOnBoot = lib.mkDefault true;

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
      enable = lib.mkDefault true;

      # Hardware - OpenGL - Enable accelerated OpenGL rendering through the Direct Rendering Interface (DRI)
      # https://search.nixos.org/options?channel=unstable&show=hardware.opengl.driSupport
      driSupport = lib.mkDefault true;
      driSupport32Bit = lib.mkDefault true;

      # Hardware - OpenGL - Additional packages to add to OpenGL drivers.
      # https://search.nixos.org/options?channel=unstable&show=hardware.opengl.extraPackages
      extraPackages = with pkgs; [
        glxinfo
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
      support32Bit = lib.mkDefault true;

      # Hardware - Pulseaudio - Package
      # https://search.nixos.org/options?channel=unstable&show=hardware.pulseaudio.package
      package = pkgs.pulseaudioFull;
    };
  };
}
