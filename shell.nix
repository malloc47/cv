with import <nixpkgs> {};

stdenv.mkDerivation {
  name = "cv";

  # fonts.fonts = with pkgs; [
  #   libertine
  #   libre-baskerville
  #   geosanslight
  # ];

  buildInputs = with pkgs; [
    texlive.combined.scheme-full
  ];
}
