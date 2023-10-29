#!/usr/bin/env bash

rustup default nightly
rustup toolchain install nightly

sudo -SE cargo install --git https://github.com/Morganamilo/paru.git
sudo -SE echo -n ""
~/.cargo/bin/paru -S --noconfirm --sudoloop \
		yt-dlp arandr p7zip discord telegram-desktop steam firefox mpv vlc cmus feh alacritty dmenu spotify ripgrep eza pychess stockfish gstreamer gpm \
		lib32-sdl2 pipewire pipewire-alsa pipewire-audio pipewire-jack pipewire-pulse pipewire-jack-dropin wireplumber lib32-nvidia-utils lib32-vulkan-mesa-layers \
		lib32-libva lib32-mesa-utils lib32-mesa lib32-glu kdeconnect fdupes fd mlocate xpdf gdb minecraft-launcher ida-free ghidra radare2 iaito r2ghidra hexedit cmake \
		dust bat qjackctl qt5ct cargo-asm cargo-zigbuild cargo-tauri cargo-watch nitrogen picom ddrescue foremost safecopy testdisk ffmpeg-obs obs-studio yt visual-studio-code-bin \
		gimp figlet hyperfine kalc yazi blender dolphin reptyr rsync ngrok ncdu peaclock rofi scrot xclip greenclip tenacity nushell netdiscover \
		htop nmap terminology jq yq

mv ~/media/* ~/Pictures
nitrogen --set-auto ~/Pictures/bg.jpg
