# Gory

*Gory OS is a personal passion project built just for fun. It was created simply because installing and configuring a Linux system from scratch can be tedious. To save time and avoid the hassle of setting everything up manually, the creator built this automated, ready-to-use distribution with the help of an AI assistant. Now, getting a beautiful and fully configured desktop is just one click away! 🤖🤝🧑‍💻*

Gory is an open-source, Arch-based Linux distribution designed for simplicity and fun. Built on top of the powerful `archiso` tool, this project provides a streamlined desktop experience out-of-the-box, featuring KDE Plasma and premium aesthetics.

## Features

- **Base**: Arch Linux
- **Desktop Environment**: KDE Plasma (Wayland)
- **Pre-installed Essentials**: 
  - Steam
  - Gamescope
  - MangoHud
  - Lutris & Heroic
  - Wine & ProtonUp-Qt
- **Third-Party Support**: Pre-configured scripts to easily install popular Windows applications via Proton.

## ✨ BIG UPDATE: Premium UI Overhaul

Gory OS has received a major visual overhaul to provide a premium experience infused with a sleek, dark aesthetic!
- **Classic Window Controls**: Left-aligned Red, Yellow, and Green buttons.
- **Floating Dock**: A centered, floating bottom dock for all your favorite applications.
- **Minimalist Top Panel**: A distraction-free, slim top bar for the clock and system tray.
- **Tela Circle Green Icons**: Premium, rounded icons with neon green accents.
- **Breeze Dark Theme**: Fully automated dark mode across the entire system.

## 🚀 How to Test Gory OS (UTM Tutorial)

If you are using Apple Silicon (M1/M2/M3/M4) and want to test the Gory OS Live Environment, follow these steps:

1. **Download the ISO**: Go to the **Actions** tab in this repository, click the latest green checkmark build, and download `Gory-ISO` from the Artifacts section.
2. **Download UTM**: Download and install [UTM](https://mac.getutm.app/).
3. **Create VM**: Open UTM, click **"+"** -> **Emulate** -> **Linux**.
4. **Boot ISO**: In the "Boot ISO Image" section, click **Browse** and select the downloaded Gory ISO.
5. **Configure Hardware**: 
   - Under **Architecture**, you MUST select `x86_64` (e.g. `Intel ICH9 based PC (2009, x86_64)`).
   - Set **Memory** to at least `4096` MB.
   - Set **CPU Cores** to `4` or `6`.
6. **Start**: Save the VM and click the Play button to boot into Gory OS!
## Building the ISO

This repository uses GitHub Actions to automatically build the ISO file. 
Whenever code is pushed to the `main` branch, the `.github/workflows/build-iso.yml` action will trigger, spin up an Arch Linux container, run the `archiso` build process, and attach the resulting `.iso` file to the GitHub Releases page.

To build it manually on an Arch Linux host:
```bash
sudo pacman -S archiso
sudo mkarchiso -v -w /tmp/archiso-tmp -o /tmp/archiso-out /path/to/gory
```

## License

This project is licensed under the GNU General Public License v3.0 - see the [LICENSE](LICENSE) file for details.
