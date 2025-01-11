if status is-interactive
    # Commands to run in interactive sessions can go here
end

function v
    nvim .
end

function l
    ls -la
end

function cotel
    nmcli device wifi rescan | nmcli device wifi connect Andrew password B0ns01rrr
end

function gits
    git status
end

function アモグセ
    cat /home/andrewmhdb/sus
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

function sshtiti
    kitty +kitten ssh andrew@192.168.143.28 
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

#export GTK_THEME=Adwaita:dark 
#export GTK2_RC_FILES=/usr/share/themes/Adwaita-dark/gtk-2.0/gtkrc
#export QT_STYLE_OVERRIDE=Adwaita-Dark
#export GTK_IM_MODULE=ibus
#export QT_IM_MODULE=ibus
#export GLFW_IM_MODULE=ibus

fish_add_path /usr/local/texlive/2024/bin/x86_64-linux

# Created by `pipx` on 2024-10-10 08:15:49
set PATH $PATH /home/andrew/.local/bin
set EDITOR nvim

# cargo-asm
function _bpaf_dynamic_completion
    set -l current (commandline --tokenize --current-process)
    set -l tmpline --bpaf-complete-rev=9 $current[2..]
    if test (commandline --current-process) != (string trim (commandline --current-process))
        set tmpline $tmpline ""
    end
    eval $current[1] \"$tmpline\"
end

complete --no-files --command cargo-asm --arguments '(_bpaf_dynamic_completion)'
