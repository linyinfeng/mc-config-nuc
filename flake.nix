{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts";
    flake-parts.inputs.nixpkgs-lib.follows = "nixpkgs";
    flake-utils.url = "github:numtide/flake-utils";
    treefmt-nix.url = "github:numtide/treefmt-nix";
    treefmt-nix.inputs.nixpkgs.follows = "nixpkgs";
    mc-config.url = "github:linyinfeng/mc-config";
    mc-config.inputs.nixpkgs.follows = "nixpkgs";
    mc-config.inputs.flake-parts.follows = "flake-parts";
    mc-config.inputs.flake-utils.follows = "flake-utils";
    mc-config.inputs.systems.follows = "flake-utils/systems";
    mc-config.inputs.treefmt-nix.follows = "treefmt-nix";
  };
  outputs = inputs @ {flake-parts, ...}:
    flake-parts.lib.mkFlake {inherit inputs;} ({
      self,
      inputs,
      ...
    }: {
      systems = [
        "x86_64-linux"
      ];
      imports = [
        inputs.treefmt-nix.flakeModule
        inputs.mc-config.flakeModules.mc-config
      ];
      perSystem = {
        config,
        pkgs,
        system,
        lib,
        ...
      }: {
        minecraftConfigurations.nuc = inputs.mc-config.lib.minecraftConfiguration {
          inherit pkgs;
          modules = [./nuc.nix];
        };
        treefmt = {
          projectRootFile = "flake.nix";
          programs = {
            alejandra.enable = true;
            prettier.enable = true;
          };
        };
      };
    });
}
