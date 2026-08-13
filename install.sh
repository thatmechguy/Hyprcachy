#!/usr/bin/env bash

set -euo pipefail

echo "Updating system..."
sudo pacman -Syu --noconfirm

# Install dependencies required for building AUR packages
sudo pacman -S --needed --noconfirm \
    base-devel \
    git \
    make \
    cmake

# Install yay if it's not already installed
if ! command -v yay &>/dev/null; then
    echo "Installing yay..."

    tmpdir=$(mktemp -d)
    git clone https://aur.archlinux.org/yay.git "$tmpdir/yay"

    pushd "$tmpdir/yay" >/dev/null
    makepkg -si --noconfirm
    popd >/dev/null

    rm -rf "$tmpdir"
fi

echo "Installing packages..."

# Official repository packages
sudo pacman -S --needed --noconfirm \
    nautilus \
    hyprland \
    kitty \
    xdg-desktop-portal-hyprland \
    blender \
    obs-studio \
    kdenlive \
    btop \
    papirus-icon-theme \
    zen-browser \
    gnome-boxes \
    helium-browser-bin \
    flatpak \
    android-tools \
    gnome-text-editor \
    gnome-disk-utility \
    loupe \
    papers \
    vlc \
    neovim \
    vscodium \


# AUR packages
yay -S --needed --noconfirm \
    noctalia-git \
    noctalia-greeter-git \
    bibata-cursor-theme-git \
    papirus-folders

flatpak install flathub org.freecad.FreeCAD
flatpak install flathub com.google.AndroidStudio
flatpak install flathub com.ultimaker.cura
flatpak install flathub com.bambulab.BambuStudio
flatpak install flathub cc.arduino.IDE2

flatpak override --user --env=ELECTRON_OZONE_PLATFORM_HINT=x11 cc.arduino.IDE2


echo "Removing old configuration..."

rm -rf \
    ~/.config/hypr \
    ~/.config/kitty \
    ~/.config/fastfetch \
    ~/.zshrc

echo "Creating symlinks..."

mkdir -p ~/.config

ln -s ~/Hyprcachy/hypr ~/.config
ln -s ~/Hyprcachy/kitty ~/.config
ln -s ~/Hyprcachy/fastfetch ~/.config
ln -s ~/Hyprcachy/.zshrc ~/

echo "Installation complete!"
