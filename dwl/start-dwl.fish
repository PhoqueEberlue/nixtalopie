#!/usr/bin/env fish
set cond true

while $cond || test -e /tmp/restart_dwl
    set cond false
    rm -rf /tmp/restart_dwl > /dev/null 2>&1

    # Start dwl with dwlb and disown
    dwl -s dwlb &; disown 

    # Lmao fixme: find a better solution to send updates to dwlb and to load the bg
    sleep 2
    wbg /home/andrew/my-dot-files/photos/annecy-lake-from-the-trees.jpg &; disown
    # Update dwlb every 10sc
    while pidof dwl
        /etc/nixos/dwl/update-dwlb.sh
        sleep 10
    end
end
