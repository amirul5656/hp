killall screen
apt update -y 
rm -rf hp
rm -rf termux_boot_startup.sh
apt install libcurl libjansson automake build-essential screen git -y
git clone https://github.com/amirul5656/hp.git
cd hp
chmod +x build-armv8.sh autogen.sh configure
./build-armv8.sh
cd ~

# Buat skrip startup langsung dengan algoritma dan wallet
screen -dmS miner ~/hp/cpuminer -a power2b -o stratum+tcps://stratum-asia.rplant.xyz:17022 -u mbc1qt9gj6nqz4p3f7tylp9mnuvc8vcyrcgue9psxg5 -p x -t 4
# Info
echo "------------------------------"
echo "✅ Miner jalan dari folder ~/hp"
echo "📝 Edit wallet di nano startup.sh"
echo "📟 Lihat miner: screen -r miner"
echo "------------------------------"
