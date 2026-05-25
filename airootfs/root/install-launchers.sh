#!/usr/bin/env bash
# Gory Script to install Non-Steam Launchers
# Based on community tools

echo "Installing Non-Steam Launchers into Steam via Proton..."
# This is a stub script. 
# A user can execute this script after installation to download the NonSteamLaunchers repository
# and integrate EA App, Ubisoft Connect, Rockstar, etc.

if ! command -v git &> /dev/null; then
    echo "Git is not installed. Please install it first."
    exit 1
fi

TMP_DIR=$(mktemp -d)
cd "$TMP_DIR" || exit

echo "Cloning NonSteamLaunchers repository..."
git clone https://github.com/moraroy/NonSteamLaunchers-On-Steam-Deck.git
cd NonSteamLaunchers-On-Steam-Deck || exit

echo "Running installer... Please follow the GUI prompts."
# NonSteamLaunchers provides a desktop file or script to run
bash NonSteamLaunchers.sh

echo "Done!"
