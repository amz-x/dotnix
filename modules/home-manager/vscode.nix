#
#  Specific system Visual Studio Code configuration settings module for home manager
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
#       │    ├─ vscode.nix *
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
#       ├─ ./video.nix
#       ├─ ./virtualisation.nix
#       ├─ ./vpn.nix
#       ├─ ./wine.nix
#       └─ ./xdg.nix

{ config, lib, pkgs, ... }:

{
  # Visual Studio Code
  # https://mipmip.github.io/home-manager-option-search/?programs.vscode
  programs.vscode = {

    # Visual Studio Code - Enable
    # https://mipmip.github.io/home-manager-option-search/?programs.vscode.enable
    enable = true;

    # Visual Studio Code - Enable Update Check
    # https://mipmip.github.io/home-manager-option-search/?programs.vscode.enableUpdateCheck
    enableUpdateCheck = pkgs.stdenv.isDarwin;

    # Visual Studio Code - Package
    # https://mipmip.github.io/home-manager-option-search/?programs.vscode.package
    package = if pkgs.stdenv.isDarwin then pkgs.vscode else pkgs.vscode.fhs;

    # Visual Studio Code - Extensions
    # https://mipmip.github.io/home-manager-option-search/?programs.vscode.extensions
    extensions = with pkgs.vscode-extensions; [      
      # Editorconfig
      editorconfig.editorconfig
      # Markdown
      davidanson.vscode-markdownlint
      # Git
      eamodio.gitlens
      # Nix
      bbenoist.nix
      arrterian.nix-env-selector
      jnoortheen.nix-ide
      # DotEnv
      mikestead.dotenv
      # DirEnv
      mkhl.direnv
      # Nushell
      thenuprojectcontributors.vscode-nushell-lang
      # Docker
      ms-azuretools.vscode-docker
      # C#
      ms-dotnettools.csharp
      # Theme
      nonylene.dark-molokai-theme
      # Ruby
      rebornix.ruby
      # Rust
      rust-lang.rust-analyzer
      serayuzgur.crates
      # LLDB
      vadimcn.vscode-lldb
      # Node.js / Javascript / Typescript
      dbaeumer.vscode-eslint
      # ChatGPT
      genieai.chatgpt-vscode
    ];

    # Visual Studio Code - User Settings
    # https://mipmip.github.io/home-manager-option-search/?programs.vscode.userSettings
    userSettings = {
      # Workbench
      "workbench.colorTheme" = "Dark (Molokai)";
      
      # Editor
      "editor.fontSize" = if pkgs.stdenv.isDarwin then 14 else 15;
      "editor.fontVariations" = false;

      # Explorer
      "explorer.confirmDelete" = false;

      # Tracking
      "telemetry.telemetryLevel" = "off";

      # Nix
      "nix.enableLanguageServer" = true;
      "nix.serverPath" = "${pkgs.nil}/bin/nil";
      "nix.formatterPath" = "${pkgs.nixfmt}/bin/nixfmt";
      "nix.serverSettings" = {
        "nil" = {
          "formatting" = {
            "command" = [ "nixfmt" ];
          };
        };
      };

      # Javascript
      "javascript.updateImportsOnFileMove.enabled" = "always";
      
      # Typescript
      "typescript.updateImportsOnFileMove.enabled" = "always";

      # Updates - VS Code
      "update.mode" = "none";

      # Updates - VS Code Extensions
      "extensions.autoUpdate" = false;
    };
  };
}
