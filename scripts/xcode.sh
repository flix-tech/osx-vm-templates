#!/bin/sh

COMMANDS=$(cat <<EOF
source ~/.bash_profile

gem install xcode-install

sudo -E xcversion install --verbose --url="file://$XCODE_DMG" "$XCODE_VERSION"
EOF)

echo "Installing Xcode..."

sudo -u "$USERNAME" bash -c "$COMMANDS"

echo "Accepting License Agreement..."

xcodebuild -license accept

echo "Removing DMG..."

rm -rf "$XCODE_DMG"

echo "Installing additional required components..."

find "/Applications/Xcode-$XCODE_VERSION.app/Contents/Resources/Packages" -name "*.pkg" | tr "\n" "\0" | xargs -0 -I {} installer -pkg {} -target / 

echo "Enabling developer mode..."

DevToolsSecurity -enable
