{ pkgs, config, ... }:
{
  imports = [
    ./hardware.nix
  ];

  environment.systemPackages = with pkgs; [
    texlive.combined.scheme-basic
    typst
    teams-for-linux
    drawio
    python311Packages.pyuv
    jdk
  ]; 

  programs.virt-manager.enable = true;

  users.groups.libvirtd.members = [ "${config.username}" ];

  virtualisation.libvirtd.enable = true;

  virtualisation.spiceUSBRedirection.enable = true;

  # services.printing = {
  #   enable = true;
  #   drivers = with pkgs; [
  #     cups-toshiba-estudio
  #   ];
  # };

  # services.printing.logLevel = "debug";

  # hardware.printers = {
  #   ensurePrinters = [
  #     {
  #       name = "lst-pb76";
  #       location = "";
  #       deviceUri = "ipp://192.168.168.76/ipp/print";
  #       model = "TOSHIBA-e-STUDIO2525AC";
  #     }
  #   ];
  #   ensureDefaultPrinter = "lst-pb76";
  # };
}
