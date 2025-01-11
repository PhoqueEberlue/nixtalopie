{ lib, ... }:
{
  options = {
    username = lib.mkOption {
      type = lib.types.str;
      default = "andrew";
    };
    nixOSConfigPath = lib.mkOption {
      type = lib.types.path;
      default = /etc/nixos;
    };
  };
}
