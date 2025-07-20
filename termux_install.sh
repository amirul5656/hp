killall screen
apt update -y 
rm -rf advcphoneminer
rm -rf advc_miner
apt install libcurl openssl libjansson automake build-essential screen git -y
git clone https://github.com/TheRetroMike/AdvcPhoneMiner.git advc_miner
cd advc_miner
./build-armv8.sh
cd ~
#echo "screen -dmS miner ~/ccminer/ccminer -a verus -o stratum+tcp://na.luckpool.net:3960 -u RKbgnfWAbL43K1HrxLoWcDzRmTspYFRj6U -p x -t 6" > startup.sh
echo "screen -dmS miner ~/advc_miner/cpuminer -a YespowerAdvc -o $1 -u $2 -p $3 -t $4" > startup.sh
chmod +x startup.sh
mkdir -p ~/.termux/boot
wget https://raw.githubusercontent.com/TheRetroMike/VerusCliMining/refs/heads/main/termux_boot_startup.sh -O ~/.termux/boot/termux_boot_startup.sh
~/startup.sh
echo "------------------------------"
echo "Miner is installed and running. Update config using nano startup.sh"
echo "To view miner now or after restart, use screen -r miner"
echo "------------------------------"
