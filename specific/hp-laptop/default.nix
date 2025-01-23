{ pkgs, ... }:
{
  imports = [
    ./hardware.nix
  ];

  environment.systemPackages = with pkgs; [
    texlive.combined.scheme-full
  ];
}
