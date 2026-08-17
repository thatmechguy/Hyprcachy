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
    adw-gtk-theme \
    qt6ct \
    zed \
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
    udiskie


# AUR packages
yay -S --needed --noconfirm \
    noctalia-git \
    noctalia-greeter-git \
    bibata-cursor-theme \
    papirus-folders

flatpak install -y flathub org.freecad.FreeCAD
flatpak install -y flathub com.google.AndroidStudio
flatpak install -y flathub com.ultimaker.cura
flatpak install -y flathub com.bambulab.BambuStudio
flatpak install -y flathub cc.arduino.IDE2

flatpak override --user --env=ELECTRON_OZONE_PLATFORM_HINT=x11 cc.arduino.IDE2


echo "Removing old configuration..."

rm -rf \
    ~/.config/hypr \
    ~/.config/kitty \
    ~/.config/fastfetch \
    ~/.zshrc

echo "Creating symlinks..."

mkdir -p ~/.config
mkdir -p ~/.local/state/noctalia

ln -s ~/Hyprcachy/hypr ~/.config
ln -s ~/Hyprcachy/kitty ~/.config
ln -s ~/Hyprcachy/fastfetch ~/.config
ln -s ~/Hyprcachy/.zshrc ~/
ln -s ~/Hyprcachy/settings.toml ~/.local/state/noctalia

echo "Installation complete!"
