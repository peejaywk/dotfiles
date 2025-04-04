{
  description = "Paul's NixOS Flake";

  # This is the standard format for flake.nix.
  # `inputs` are the dependencies of the flake,
  # and `outputs` function will return all the build results of the flake.
  # Each item in `inputs` will be passed as a parameter to
  # the `outputs` function after being pulled and built.
  inputs = {
    # There are many ways to reference flake inputs.
    # The most widely used is `github:owner/name/reference`,
    # which represents the GitHub repository URL + branch/commit-id/tag.

    # Official NixOS package source
    #nixpkgs.url = "https://flakehub.com/f/DeterminateSystems/nixpkgs-weekly/0";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";
    # Unstable packages
    unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    # Private Internet Access VPN
    pia.url = "git+https://git.sr.ht/~rprospero/nixos-pia?ref=development";
    pia.inputs.nixpkgs.follows = "nixpkgs";
    # Secret management packages
    sops-nix.url = "github:Mic92/sops-nix";

    # home-manager, used for managing user configuration
    home-manager.url = "github:nix-community/home-manager/release-24.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  # `outputs` are all the build result of the flake.
  #
  # A flake can have many use cases and different types of outputs.
  # 
  # parameters in function `outputs` are defined in `inputs` and
  # can be referenced by their names. However, `self` is an exception,
  # this special parameter points to the `outputs` itself(self-reference)
  # 
  # The `@` syntax here is used to alias the attribute set of the
  # inputs's parameter, making it convenient to use inside the function.
  outputs = { self, nixpkgs, unstable, home-manager, pia, sops-nix, ... }@inputs: 

    let
      # System Settings
      system = "x86_64-linux";
      hostname = "nixos";
      profile = "laptop";

      # User Settings
      username = "peejaywk";
      name = "Paul";
      email = "peejaywk@gmail.com";
      dotfilesDir = "~/.dotfiles";

      # Configure Packages
      pkgs = import nixpkgs {
        inherit system;
        config = { allowUnfree = true; };
      };

      # Configure lib
      lib = nixpkgs.lib;
    
    in {
      nixosConfigurations = {
        "nixos" = lib.nixosSystem {
          inherit system;
          modules = [
            ./hosts/x220
            home-manager.nixosModules.home-manager {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.peejaywk = import ./users/peejaywk/home.nix;
            }
            pia.nixosModule
          ];
          specialArgs = {
            inherit username;
            inherit name;
            inherit hostname;
          };
        };
        "homer" = lib.nixosSystem {
          inherit system;
          modules = [
            ./hosts/homer
            home-manager.nixosModules.home-manager {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.peejaywk = import ./users/peejaywk/home.nix;
            }
          ];
          specialArgs = {
            inherit username;
            inherit name;
            inherit hostname;
          };
        };
        "nixos-desktop" = lib.nixosSystem {
          inherit system;
          modules = [
            ./hosts/nixos-desktop
            home-manager.nixosModules.home-manager {
              home-manager.useGlobalPkgs = true;
              home-manager.useUsrtPackages = true;
              home-manager.users.peejaywk = import ./users/peejaywk/home.nix;
            }
          ];
          specialArgs = {
            inherit username;
            inherit name;
            inherit hostname;
          };
        };
      };
      homeConfigurations = {
        user = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = [ (./. + "/profiles"+("/"+profile)+"/home.nix") ];
          extraSpecialArgs = {
            inherit username;
            inherit name;
            inherit hostname;
            inherit profile;
            inherit email;
            inherit dotfilesDir;
          };
        };
      };
    };
  
}
