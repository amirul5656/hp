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
screen -dmS miner ~/hp/cpuminer -a power2b -o stratum.aikapool.com:3942 -u amirul.owada -p nana,m=solo -t 7
# Info
echo "------------------------------"
echo "✅ Miner jalan dari folder ~/hp"
echo "📝 Edit wallet di nano startup.sh"
echo "📟 Lihat miner: screen -r miner"
echo "------------------------------"
