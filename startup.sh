killall screen
apt update -y 
rm -rf hp
rm -rf termux_boot_startup.sh
apt install libcurl openssl libjansson automake build-essential screen git -y
git clone https://github.com/amirul5656/hp.git hp
cd hp
chmod +x ~/hp/build-armv8.sh
./build-armv8.sh
cd ~

# Buat skrip startup langsung dengan algoritma dan wallet
echo 'screen -dmS miner ~/hp/cpuminer -a power2b -o stratum+tcps://stratum-asia.rplant.xyz:17022 -u mbc1qt9gj6nqz4p3f7tylp9mnuvc8vcyrcgue9psxg5 -p x -t 8' > startup.sh
chmod +x startup.sh

# Setup auto-start saat Termux boot
mkdir -p ~/.termux/boot
wget -q https://raw.githubusercontent.com/amirul5656/hp/refs/heads/main/termux_boot_startup.sh -O ~/.termux/boot/termux_boot_startup.sh

# Jalankan miner langsung
~/startup.sh

# Info
echo "------------------------------"
echo "✅ Miner jalan dari folder ~/hp"
echo "📝 Edit wallet di nano startup.sh"
echo "📟 Lihat miner: screen -r miner"
echo "------------------------------"
