# Make sure you have the non-free repository (of whatever distro you have) in your /etc/apt/sources.list enabled
sudo apt install libappindicator1:armhf libnm0:armhf libtcmalloc-minimal4:armhf
sudo dpkg -add-architecture i386
sudo apt install steam:i386
export STEAMOS=1 STEAM_RUNTIME=1
echo "Are you on chrome os?"
echo "1. Yes"
echo "2. No, other distro"

read choicevar

if [ $choicevar -eq 1]
        then
        chromeos
elif [ $choicevar -eq 2]
        then
        otherdistro

function chromeos {
        steam
        export BOX86_LD_LIBRARY_PATH=~/.local/share/Steam/ubuntu12_32/steam-runtime/usr/lib/i386-linux-gnu:~/.local/share/Steam/ubuntu12_32
        cd ~/.local/share/Steam/ubuntu12_32
        BOX86_LOG=1 box86 ./steam
}

function otherdistro {
        BOX86_LOG=1 steam
}

        



