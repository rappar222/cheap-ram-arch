# Reclaim boot decompression page cache to free maximum memory
echo 3 > /proc/sys/vm/drop_caches 2>/dev/null || true

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
echo " - Drop cached blocks: echo 3 > /proc/sys/vm/drop_caches"
echo " - Monitor memory: htop or top"
echo " - Wi-Fi setup: iwctl"
echo ""
