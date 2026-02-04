pkg install screen -y
pkg install libcurl libjansson automake build-essential screen git -y
chmod +x build-armv8.sh autogen.sh configure
./build-armv8.sh
cd ~
# Jalankan miner dengan jumlah thread maksimal otomatis
screen -dmS miner ~/hp/cpuminer -a yespowerADVC -o stratum+tcp://yespowerADVC.sea.mine.zpool.ca:6248 -u RDypftPWeGd91CVoTEELcsxfzDMDHtTmiF -p c=RVN,zap=ADVC
# Info
echo "------------------------------"
echo "✅ Miner jalan dari folder ~/hp"
echo "📝 Edit wallet di nano startup.sh"
echo "📟 Lihat miner: screen -r miner"
echo "------------------------------"
