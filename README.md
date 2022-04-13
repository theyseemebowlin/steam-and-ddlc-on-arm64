# box86-ddlc-on-arm64
how to run ddlc on arm64 using wine, emulated by box86
Install armhf libs by `sudo dpkg --add-architecture armhf` and `sudo apt install gcc-arm-linux-gnueabihf` then go to https://github.com/novaspirit/rpi_ubu64_desktop (read the README.md and install needed armhf libs for box86 from there)
So first, we got to get box86, of course. We can grab the repository by `git clone https://github.com/ptitSeb/box86`
Then, type in `cd box86` then `mkdir build; cd build; cmake .. -DRPI4ARM64=1 -DCMAKE_BUILD_TYPE=RelWithDebInfo` (I'd just go with the raspberry pi compilation instructions)
Then,
