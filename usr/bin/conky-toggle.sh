#!/bin/bash
# Filename:      conkytoggleflux.sh
# Purpose:       toggle conky on/off from fluxbox menu
# Authors:       Kerry and anticapitalista, secipolla for antiX
# Authors:       modified for mx linux version 17 by dolphin oracle
# Latest change: Sun December 10, 2017.
# https://github.com/MX-Linux/conky-toggle-mx
################################################################################

main()
{
if pidof conky | grep [0-9] > /dev/null
 then
  killall conky 
  autostart_off
 else
    test=$(grep -q "conky -c" /home/$USER/.config/conky/conky-sessionfile && echo $?)
    if [ "$test" = "0" ]; then
         launch_conky
         autostart_on
    else
    am-conkyzen &
    fi
fi
}

launch_conky()
{
sh am-conky-session &
}

autostart_off()
{
    
if [ -e /home/$USER/.config/autostart/conky.desktop ]; then 
    sed -i -r s/Hidden=.*/Hidden=true/ /home/$USER/.config/autostart/conky.desktop
fi

}

autostart_on()
{
    
if [ -e /home/$USER/.config/autostart/conky.desktop ]; then 
    sed -i -r s/Hidden=.*/Hidden=false/ /home/$USER/.config/autostart/conky.desktop
fi

}

main
exit 0