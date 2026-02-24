#!/bin/bash
# =========================================================
# Java Developer macOS Setup Script
# Applies Finder, Terminal, Quick Look, Dock, Keyboard, and System tweaks
# =========================================================
# Copyright (c) 2026 Nikolas Charalambidis
# All rights reserved.
#
# This script is provided "as-is" for personal or professional use.
# You may modify, copy, or redistribute it for personal or internal use.
# Commercial redistribution or sale is prohibited without explicit permission.
#
# Author: Nikolas Charalambidis
# Date: 2026-02-22
# License: Proprietary / Personal Use
# =========================================================

echo "ℹ️ Starting Java Dev macOS setup..."

# ------------------------------
# Finder
# ------------------------------
echo "⮕  Configuring Finder..."

# Show full POSIX path in title bar
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true

# Show hidden files (.git, .idea, etc.)
defaults write com.apple.finder AppleShowAllFiles -bool true

# Extra safety for extensions in nested projects.
defaults write com.apple.finder ShowAllFilenameExtensions -bool true

# Show path bar at bottom
defaults write com.apple.finder ShowPathbar -bool true

# Show status bar (file count, size)
defaults write com.apple.finder ShowStatusBar -bool true

# Set default view style to list
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"

# Allow text selection in Quick Look
defaults write com.apple.finder QLEnableTextSelection -bool true

# Sort folders first
defaults write com.apple.finder _FXSortFoldersFirst -bool true

# Disable extension change warning
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

# Prevent .DS_Store on network drives
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

# Prevent .DS_Store on USB/external drives
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

# Always expand “Get Info” panes fully — useful when inspecting files and permissions.
defaults write com.apple.finder FXInfoPanesExpanded -dict General -bool true OpenWith -bool true Preview -bool true

# ------------------------------
# Terminal
# ------------------------------
echo "⮕  Configuring Terminal..."

# Force UTF-8 in Terminal for logs, XML, JSON, Maven output.
defaults write com.apple.terminal StringEncodings -array 4

# Disable press-and-hold popup for keys; allows fast key repeats in editors.
#defaults write -g ApplePressAndHoldEnabled -bool false

# ------------------------------
# Quick Look
# ------------------------------
echo "⮕  Configuring Quick Look..."

# Make Quick Look previews instant
defaults write -g QLPanelAnimationDuration -float 0

# ------------------------------
# Save Panel
# ------------------------------
echo "⮕  Configuring Save Panel..."

# Expand save panel by default
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true

# ------------------------------
# Keyboard
# ------------------------------
echo "⮕  Configuring Keyboard..."

# Fast key repeat
defaults write -g KeyRepeat -int 4
defaults write -g InitialKeyRepeat -int 20

# ------------------------------
# Window Behavior
# ------------------------------
echo "⮕  Configuring Window Behavior..."

# Double-click title bar to maximize
defaults write -g AppleActionOnDoubleClick -string "Maximize"

# ------------------------------
# Battery
# ------------------------------
echo "⮕  Configuring Battery Percentage Icon..."

defaults write com.apple.controlcenter BatteryShowPercentage -bool true

# ------------------------------
# Show ~/Library
# ------------------------------
echo "⮕  Configuring Showing ~/Library folder..."

# Show the ~/Library folder
chflags nohidden ~/Library

# ------------------------------
# Screenshots Location
# ------------------------------
echo "⮕  Configuring Screenshots Location..."

# Set a screenshot location
mkdir -p ~/Desktop/Screenshots
defaults write com.apple.screencapture location ~/Desktop/Screenshots

# ------------------------------
# Restarting
# ------------------------------
echo "⮕  Restarting ControlCenter..."
killall ControlCenter

echo "⮕  Restarting Finder..."
killall Finder

echo "⮕  Restarting Dock..."
killall Dock

# ------------------------------
# Final message
# ------------------------------
echo "✅ Setup complete! Some changes may require log out/restart to fully apply (keyboard, maximize behavior)."
