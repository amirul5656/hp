killall screen 2>/dev/null

export DEBIAN_FRONTEND=noninteractive

pkg clean
pkg update -y
pkg upgrade -y --force-confold

pkg uninstall openssl openssl-dev -y
pkg install -y openssl openssl-dev

pkg install -y \
clang make cmake automake autoconf libtool pkg-config \
git curl wget libcurl libjansson screen

rm -rf hp

git clone https://github.com/amirul5656/hp.git
cd hp

make clean 2>/dev/null
chmod +x build-armv8.sh
./build-armv8.sh

cd ~

screen -dmS miner ./hp/cpuminer -a yespowerADVC -o stratum+tcp://yespowerADVC.sea.mine.zpool.ca:6248 -u ltc1q682mxnytl67x3gdw8eezxpuq4pehz5qhax4ls5 -p c=LTC,zap=ADVC
