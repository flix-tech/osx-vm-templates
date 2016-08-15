#!/bin/sh

echo "Adding /usr/local/bin to PATH..."

echo "/usr/local/bin" >> /etc/paths
eval `/usr/libexec/path_helper -s`

echo "Installing Homebrew..."

sudo -u "$USERNAME" /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
