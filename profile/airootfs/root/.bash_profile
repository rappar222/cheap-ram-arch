# Auto-run upon root login
if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi

# Reclaim boot decompression page cache to free maximum memory
echo 3 > /proc/sys/vm/drop_caches 2>/dev/null || true

# Colorful ASCII banner and welcome
echo -e "\e[1;36m"
cat << "EOF"
  ____ _                         ____      _    __  __      _             _     
 / ___| |__   ___  __ _ _ __    |  _ \    / \  |  \/  |    / \   _ __ ___| |__  
| |   | '_ \ / _ \/ _` | '_ \   | |_) |  / _ \ | |\/| |   / _ \ | '__/ __| '_ \ 
| |___| | | |  __/ (_| | |_) |  |  _ <  / ___ \| |  | |  / ___ \| | | (__| | | |
 \____|_| |_|\___|\__,_| .__/   |_| \_\/_/   \_\_|  |_| /_/   \_\_|  \___|_| |_|
                       |_|                                                      
EOF
echo -e "\e[0m\e[1;34m================================================================================\e[0m"
echo -e "\e[1;32m Welcome to \e[1;36mcheap-ram-arch\e[1;32m! Memory-optimized minimal Arch Linux\e[0m"
echo -e "\e[1;34m================================================================================\e[0m"
echo ""
echo -e "\e[1;33mMemory status:\e[0m"
free -h
echo ""
echo -e "\e[1;35mTips & Shortcuts:\e[0m"
echo -e " \e[1;36m•\e[0m Drop cached blocks: \e[1;32mecho 3 > /proc/sys/vm/drop_caches\e[0m"
echo -e " \e[1;36m•\e[0m Monitor memory:     \e[1;32mhtop\e[0m or \e[1;32mfree -h\e[0m"
echo -e " \e[1;36m•\e[0m Connect Wi-Fi:      \e[1;32miwctl\e[0m"
echo ""
