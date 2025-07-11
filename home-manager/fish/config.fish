if status is-interactive
    # Commands to run in interactive sessions can go here
end

function v
    nvim $argv
end

function l
    ls -la
end

function cotel
    nmcli device wifi rescan | nmcli device wifi connect Andrew password B0ns01rrr
end

function polyvpn
    sudo openconnect -u maryhuea vpn.univ-smb.fr
end

function polymount
    sudo mount.cifs //se-ens-epua/homes /mnt/share/polyhome -o user=maryhuea
end

function gitgraph
    git log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(auto)%d%C(reset)' --all
end

function watch-exec
    # Check if both arguments are provided
    if test -z "$argv[1]" -o -z "$argv[2]"
        echo "Usage: watch-exec FILE_PATH COMMAND"
        return 1
    end

    set file_path $argv[1]
    set command_to_execute $argv[2]

    # Get the initial modification time of the file
    set last_mtime (stat -c %Y $file_path)

    while true
        # Get the current modification time of the file
        set current_mtime (stat -c %Y $file_path)

        # Compare current modification time with the last recorded time
        if test "$current_mtime" != "$last_mtime"
            # Execute the specified command
            eval $command_to_execute
            
            # Update the last modification time
            set last_mtime $current_mtime
        end

        # Sleep for 1 second before checking again
        sleep 1
    end
end

set EDITOR nvim

function icat $argv
    kitten icat $argv
end

function fish_prompt --description 'Write out the prompt'
    set -l last_pipestatus $pipestatus
    set -lx __fish_last_status $status # Export for __fish_print_pipestatus.
    set -l normal (set_color normal)
    set -q fish_color_status
    or set -g fish_color_status red

    # Color the prompt differently when we're root
    set -l color_cwd $fish_color_cwd
    set -l suffix '>'
    if functions -q fish_is_root_user; and fish_is_root_user
        if set -q fish_color_cwd_root
            set color_cwd $fish_color_cwd_root
        end
        set suffix '#'
    end

    # Write pipestatus
    # If the status was carried over (if no command is issued or if `set` leaves the status untouched), don't bold it.
    set -l bold_flag --bold
    set -q __fish_prompt_status_generation; or set -g __fish_prompt_status_generation $status_generation
    if test $__fish_prompt_status_generation = $status_generation
        set bold_flag
    end
    set __fish_prompt_status_generation $status_generation
    set -l status_color (set_color $fish_color_status)
    set -l statusb_color (set_color $bold_flag $fish_color_status)
    set -l prompt_status (__fish_print_pipestatus "[" "]" "|" "$status_color" "$statusb_color" $last_pipestatus)

    set -l nix_shell_info (
      if test -n "$IN_NIX_SHELL"
        echo -n (set_color blue) "[nix]" $normal
      end
    )

    echo -n -s (prompt_login)' ' (set_color $color_cwd) (prompt_pwd) $normal (set_color purple) (fish_vcs_prompt) $normal $nix_shell_info " "$prompt_status $suffix " "
end
