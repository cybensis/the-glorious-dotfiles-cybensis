CONFIG_PATH=$(ps aux | grep -i picom | grep -Po '(?<=config).*') 
killall picom
# Sleep for a short bit after killing picom, otherwise it doesn't run
sleep 0.1
picom -b --blur-method "dual_kawase" --dbus --config $CONFIG_PATH
