{
  description = "Development environment Angular - Node";

  inputs = {
    nixpkgs = { url = "github:NixOS/nixpkgs/nixpkgs-unstable"; };
    flake-utils = { url = "github:numtide/flake-utils"; };
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        inherit (nixpkgs.lib) optional;
        pkgs = import nixpkgs { inherit system; };

      in

      {
        devShell = pkgs.mkShell
          {
            buildInputs = with pkgs;[
              nodejs-16_x
              nodePackages."@angular/cli"
            ];

            shellHook = ''
              echo node environment
              echo angular version
              ng v
            '';
          };
      }
    );
}
