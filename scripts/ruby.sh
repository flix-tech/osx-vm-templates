#!/bin/sh

RUBY_VERSION="2.0.0-p481"

COMMANDS=$(cat <<EOF
source /etc/profile

brew install rbenv
rbenv init - bash >> ~/.bash_profile
source ~/.bash_profile

rbenv install $RUBY_VERSION
rbenv global $RUBY_VERSION
rbenv shell $RUBY_VERSION

cat > ~/.gemrc <<INNER_EOF
gem: --no-document
INNER_EOF

gem install bundler
EOF)

echo "Installing rbenv, ruby $RUBY_VERSION and bundler..."

sudo -u "$USERNAME" bash -c "$COMMANDS"
