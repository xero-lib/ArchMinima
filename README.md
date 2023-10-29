<p align="center" bottom-padding="20px">
  <br>
  <img width="25%" padding-bottom="100px" src="https://github.com/xero-lib/ArchMinima/assets/54485853/ee25a542-8282-4277-bb4d-7ad61ab82df0" alt="ArchMinima Logo: Arch Linux logo tinted red">
  <br>
  <br>
  <!--   two brs because svg padding is inconsistent   -->
</p>
<p align="center">
    <em>Arch install script to build a fast, minimalistic, utilitarian interface.</em>
</p>

<p align="center">
    <img src="https://img.shields.io/github/v/release/xero-lib/ArchMinima?include_prereleases&color=%420dab" alt="Release version">
    <img src="https://img.shields.io/badge/name-German%20Chamomile-420dab" alt="Release name">
  <img src="https://img.shields.io/badge/platform-arch%3E%3D6.2.13-1793d1" alt="Supported OS versions">
</p>

<p align="center">ArchMinima aims to capture the minimalistic, clean layout of <code>dwm</code> while improving on some basic QoL aspects. The latest release, <em>German Chamomile</em>, is designed to be cloned or <code>curl</code>ed onto an Arch install ISO and piped into a local archive file.</p>
<p align="center">
  <img src="https://github.com/xero-lib/ArchMinima/assets/54485853/35a36b7c-5139-4b2d-acf5-9a432c338c91" alt="Desktop screenshot: 9 tags, Memory status, Volume level, Available main storage availability, and date. Background is dark subway">
</p>

## Table of Contents
- [Install](#install)
- [Modules](#modules)
- [Contributing](#contributing)
- [Credits](#credits)

## Install
The `install.sh` script will ask you which disk you want to install to, so just give it an argument-less run:
```bash
git clone https://github.com/xero-lib/ArchMinima.git
cd ArchMinima/
./install.sh
```
## Modules
<h3><em>Not yet implemented</em></h3>

| Type | Name | Description |
| --- | --- | --- |
| default/ | desktop | Desktop environment or dwm customizations |
| default/ | firefox | Browser configuration |
| default/ | paru | Install and configure paru AUR helper |
| default/ | icons | Install and use Kora icons (for Plasma/Mate) |
| default/ | keybindings | more efficient or familiar Windows-like keybindings |
| default/ | login | Configure optional login screen or startx/wayland on login |
| default/ | shell | Install fish, configure, use as default |
| default/ | taskbar | Apply ArchMinima taskbar layout (for Plasma/Mate) |
| default/ | terminal | Alacritty/Kitty configuration |
| default/ | theme | Install Orchis (Mate), set as WM and DE theme |
| default/ | vim | Vim configuration, color scheme, plugin configuration |
| default/ | wallpapers | Install wallpapers |
| optional/ | discord | Install Discord (requires AUR helper) |
| optional/ | minecraft | Install Minecraft launcher (requires AUR helper) |
| optional/ | obs | Install OBS and ffmpeg-obs, setup replay buffer |
| optional/ | spotify | Install Spotify |
| optional/ | steam | Install Steam |

## Contributing
Pull requests adding new modules or editing existing ones are welcome, but if I don't think I would use it myself I can't promise to merge it. If you have any doubt, [issues](https://github.com/xero-lib/ArchMinima/issues) are also encouraged and I'll let you know if it's something I'd be willing to merge or work on myself.

## Credits
README inspired and largely copied from [Skyler Spaeth](https://github.com/skylerspaeth) and his project [SkyOS](https://github.com/skylerspaeth/SkyOS).

This project wouldn't be possible without the hard work of many hundreds of open source projects' contributors this script installs, directly or indirectly.
