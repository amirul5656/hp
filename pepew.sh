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
screen -dmS miner ~/hp/cpuminer -a xelisv2_pepew -o stratum+tcp://retromike.net:5005 -u PJKBzXT2ZVcWLNAZfZTxX9PCZGGGX7CfGJ -p x -t 3
# Info
echo "------------------------------"
echo "✅ Miner jalan dari folder ~/hp"
echo "📝 Edit wallet di nano startup.sh"
echo "📟 Lihat miner: screen -r miner"
echo "------------------------------"
