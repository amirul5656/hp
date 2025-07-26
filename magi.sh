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

# Jalankan miner dengan jumlah thread maksimal otomatis
screen -dmS miner ~/hp/cpuminer -a m7m -o stratum+tcp://m7m.sea.mine.zpool.ca:6033 -u 9P124xJj1Sq9HgPemLcxLdBxSKn2WYUQ5Q -p x -t 8
# Info
echo "------------------------------"
echo "✅ Miner jalan dari folder ~/hp"
echo "📝 Edit wallet di nano startup.sh"
echo "📟 Lihat miner: screen -r miner"
echo "------------------------------"
