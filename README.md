# box86-ddlc-on-arm64
how to run ddlc on arm64 using wine, emulated by box86
Install armhf libs by `sudo dpkg --add-architecture armhf` and `sudo apt install gcc-arm-linux-gnueabihf` then go to https://github.com/novaspirit/rpi_ubu64_desktop (read the README.md and install needed armhf libs for box86 from there)
So first, we got to get box86, of course. We can grab the repository by `git clone https://github.com/ptitSeb/box86`
Then, type in `cd box86` then `mkdir build; cd build; cmake .. -DRPI4ARM64=1 -DCMAKE_BUILD_TYPE=RelWithDebInfo; make -j4; sudo make install` (I'd just go with the raspberry pi compilation instructions)
Then, type in ` git clone https://github.com/NicoD-SBC/armbian-gaming` and then type in `cd armbian-gaming` then run `./armbian-gaming.sh` and then type in '4' when prompted with a list of choices.
Then, go to https://github.com/Kron4ek/Wine-Builds/releases and download latest release (if the latest release doesn't work try some earlier release like 7.1), move it to linux folders, of course, then untar it using `tar -xf wine-release-number-x86.tar.xz` then rename that folder to just `wine`
We are now ready to run DDLC. Go to https://ddlc.moe/ and download ddlc for linux from there and then move that to your linux folders. Then `cd DDLC-1.1.1-pc` and then run `wine ddlc.exe` and it should work!
Do note however that there isn't any audio after you run it the frist time, so you're gonna have to manage playing it through the first time only, but in terms of bugs thats about it.
And that is how you run ddlc, with the power of box86 and wine, on arm64 chromebooks!
