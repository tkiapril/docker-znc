#! /usr/bin/env bash
set -e

# Ensure package list is up to date.
pacman -Syy

# Install runtime dependencies.
pacman -S --noconfirm sudo

# Install build dependencies.
pacman -S --noconfirm make git gcc perl python openssl pkg-config swig icu automake autoconf


# Prepare building
mkdir -p /src


# Download, compile and install ZNC.
cd /src
git clone https://github.com/znc/znc.git --recursive
cd znc
./bootstrap.sh && ./configure --enable-python=python-3.4 && make && make install


# Clean up
yes y | sudo pacman -Sc
yes y | sudo pacman -Scc && rm -rf /tmp/* /var/tmp/*
