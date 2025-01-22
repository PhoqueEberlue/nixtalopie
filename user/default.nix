{ pkgs, config, ...}:
{
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users."${config.username}" = {
    isNormalUser = true;
    description = "andrew";
    extraGroups = [ "networkmanager" "wheel" "video" "input" ];
    packages = with pkgs; [];
  };

  security.sudo.extraRules = [
    {  
      users = [ "${config.username}" ];
      commands = [
        # Security goes brrrrrrrrrrrrr
        { command = "ALL" ; options= [ "NOPASSWD" ]; }
      ];
    }
  ];

  # Create symlinks for my dotfiles to ~${config.username}
  system.activationScripts.createDotConfigSymlinks = {
    text = ''
      # Get the names of config directories in dot-files
      config_directories=$(find ${config.nixOSConfigPath}/user/dot-files/ -maxdepth 1 -mindepth 1 -type d -printf "%f\n")

      for dir_name in $config_directories; do
        target_path=~${config.username}/.config/$dir_name 

        # If the target isn't a symlink i.e. not generated by NixOS, save it just in case.
        if [ ! -L $target_path ]; then
          mv $target_path $target_path.bak
        else
        # Else remove the already existing symlink to refresh it
          echo "Deleting symlink at $target_path"
          rm $target_path
        fi

        echo "Creating a symlink from ${config.nixOSConfigPath}/user/dot-files/$dir_name to $target_path"
        ln -s ${config.nixOSConfigPath}/user/dot-files/$dir_name $target_path
      done
    '';
  };

}
