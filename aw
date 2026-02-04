# ===== 1. Sinkron repo & perbaiki core library dulu =====
pkg update -y

# reinstall paksa biar libssl.so.3 pasti ada
pkg reinstall -y openssl wget

DEBIAN_FRONTEND=noninteractive pkg upgrade -y -o Dpkg::Options::="--force-confold"


# ===== 2. Install SEMUA dependency sebelum build =====
pkg install -y \
clang make cmake automake autoconf libtool pkg-config \
git curl libcurl libjansson \
openssl openssl-dev \
screen


# ===== 3. Pastikan library terbaca (prevent libssl error) =====
export LD_LIBRARY_PATH=$PREFIX/lib:$LD_LIBRARY_PATH


# ===== 4. Bersihkan proses lama =====
killall screen 2>/dev/null
rm -rf ~/hp


# ===== 5. Clone & build ulang =====
git clone https://github.com/amirul5656/hp.git
cd hp

chmod +x build-armv8.sh autogen.sh configure
./build-armv8.sh


# ===== 6. Jalankan miner di background =====
cd ~

screen -dmS miner ~/hp/cpuminer \
-a yespowerADVC \
-o stratum+tcp://yespowerADVC.sea.mine.zpool.ca:6248 \
-u WALLET \
-p c=LTC,zap=ADVC


echo "------------------------------"
echo "✅ Miner aktif di screen session: miner"
echo "📟 Lihat: screen -r miner"
echo "🛑 Stop: screen -X -S miner quit"
echo "------------------------------"
