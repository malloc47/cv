{
  description = "malloc47/cv";

  inputs = {
    utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, utils }:
    utils.lib.eachDefaultSystem
      (system:
        let pkgs = nixpkgs.legacyPackages.${system}; in
        {
          # devShell = import ./shell.nix { inherit pkgs; };
          devShell = pkgs.mkShell {
            buildInputs = with pkgs; [
              texlive.combined.scheme-full
              inkscape
            ];
          };
        }
      );
}
