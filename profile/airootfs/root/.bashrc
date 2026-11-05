# Auto-run upon root login
cat << "EOF"

  ____ _                         ____      _    __  __      _             _     
 / ___| |__   ___  __ _ _ __    |  _ \    / \  |  \/  |    / \   _ __ ___| |__  
| |   | '_ \ / _ \/ _` | '_ \   | |_) |  / _ \ | |\/| |   / _ \ | '__/ __| '_ \ 
| |___| | | |  __/ (_| | |_) |  |  _ <  / ___ \| |  | |  / ___ \| | | (__| | | |
 \____|_| |_|\___|\__,_| .__/   |_| \_\/_/   \_\_|  |_| /_/   \_\_|  \___|_| |_|
                       |_|                                                      
EOF
echo "================================================================================"
echo " Welcome to cheap-ram-arch! Memory-optimized minimal Arch Linux"
echo "================================================================================"
echo ""
echo "Memory status:"
free -h
echo ""
echo "Tips:"
echo " - Monitor memory: htop or top"
echo " - Wi-Fi setup: iwctl"
echo " - Network status: networkctl status"
echo ""
