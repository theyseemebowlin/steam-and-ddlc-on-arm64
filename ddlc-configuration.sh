# Install needed armhf compiler and armhf libs for box86
sudo apt install arm-linux-gnueabihf 
sudo dpkg --add-architecture armhf; sudo apt install libc6:armhf  libx11-6:armhf  libgdk-pixbuf2.0-0:armhf libgtk2.0-0:armhf libstdc++6:armhf libsdl2-2.0-0:armhf mesa-va-drivers:armhf libsdl1.2-dev:armhf libsdl-mixer1.2:armhf libpng16-16:armhf libcal3d12v5:armhf libsdl2-net-2.0-0:armhf libopenal1:armhf libsdl2-image-2.0-0:armhf libvorbis-dev:armhf libcurl4:armhf osspd:armhf pulseaudio:armhf libjpeg62:armhf libudev1:armhf libgl1-mesa-dev:armhf libsnappy1v5:armhf libx11-dev:armhf libsmpeg0:armhf libboost-filesystem1.71.0:armhf libboost-program-options1.71.0:armhf libavcodec58:armhf libavformat58:armhf libswscale5:armhf libmyguiengine3debian1v5:armhf libboost-iostreams1.71.0:armhf  libsdl2-mixer-2.0-0:armhf
sudo apt install libnss3:armhf libnm0:armhf libdbus-glib-1-2:armhf libudev1:armhf libnspr4:armhf libgudev-1.0-0:armhf libusb-1.0-0:armhf libappindicator1:armhf
# Compile box86
cd
git clone https://github.com/ptitSeb/box86
cd box86
mkdir build; cd build; cmake .. -DRPI4ARM64=1 -DCMAKE_BUILD_TYPE=RelWithDebInfo
make -j2
sudo make install
sudo systemctl restart systemd-binfmt 
echo "if you are on a chrome os distro, binfmt won't work as there is no binfmt integration, so ignore the error"

function choice {
echo "1. chrome os distro"
echo " 2. other distro"

read choicevar

if [ $choicevar -eq 1]
        then
        chromeos
elif [ $choicevar -eq 2]
        then
        otherdistro
fi
}

function chromeos {
        git clone https://github.com/NicoD-SBC/armbian-gaming
        cd armbian-gaming
        ./armbian-gaming.sh
        4
        cd
        wget https://github.com/Kron4ek/Wine-Builds/releases/download/7.6/wine-7.6-x86.tar.xz
        mv ~/wine-7.6-x86 ~/wine
}
function otherdistro {
        echo "Taken straight from the wine guide made by ptitSeb, shoutout to him"
        # Install shortcuts (make launcher & symlinks. Credits: grayduck, Botspot)
        echo -e '#!/bin/bash\nsetarch linux32 -L '"$HOME/wine/bin/wine "'"$@"' | sudo tee -a /usr/local/bin/wine >/dev/null # Create a script to launch wine programs as 32bit only
        #sudo ln -s ~/wine/bin/wine /usr/local/bin/wine # You could aslo just make a symlink, but box86 only works for 32bit apps at the moment
        sudo ln -s ~/wine/bin/wineboot /usr/local/bin/wineboot
        sudo ln -s ~/wine/bin/winecfg /usr/local/bin/winecfg
        sudo ln -s ~/wine/bin/wineserver /usr/local/bin/wineserver
        sudo chmod +x /usr/local/bin/wine /usr/local/bin/wineboot /usr/local/bin/winecfg /usr/local/bin/wineserver
        # Boot wine (make fresh wineprefix in ~/.wine )
        wine wineboot
}

echo "Now it is time to run DDLC, I assume you read the README.md that said to download the DDLC file before running this"
cd
cd DDLC-1.1.1-pc
wine DDLC.exe
      
