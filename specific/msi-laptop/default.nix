{ pkgs, ... }:
{
  imports = [
    ./hardware.nix
    ./steam
  ];

  environment.systemPackages = with pkgs; [
    protonup
  ];
}
