{
  xxd,
  ncurses,
  stdenv,
  fetchFromGitHub,
}:
stdenv.mkDerivation (finalAttrs: {
  pname = "cdvd";
  version = "0.1.0";

  src = fetchFromGitHub {
    owner = "Szmelc-INC";
    repo = "cdvd";
    rev = "5ec143b0c8847bab03e48751eebaa55b87e2faa9";
    hash = "sha256-Vy38DrMwQ/H7/ZSYbHq06Ua+6hIUpYXz/HFbb5aK/T0=";
  };

  buildInputs = [
    xxd
    ncurses
  ];

  makeFlags = [
    "BINDIR=$(out)/bin"
  ];
})
