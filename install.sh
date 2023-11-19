#!/usr/bin/env bash

set -Ceuo pipefail

cd $HOME

# Clone beestrap
BEESTRAP_PATH="$HOME/.beestrap"
if [ ! -d $BEESTRAP_PATH ]; then
  git clone https://github.com/corrupt952/beestrap.git $BEESTRAP_PATH
fi

# Install aqua
AQUA_VERSION="v2.2.0"
if [ -z "$(command -v aqua)" ]; then
  curl -sSfL -O https://raw.githubusercontent.com/aquaproj/aqua-installer/${AQUA_VERSION}/aqua-installer
  echo "d13118c3172d90ffa6be205344b93e8621de9bf47c852d80da188ffa6985c276  aqua-installer" | sha256sum -c
  chmod +x aqua-installer
  ./aqua-installer
  rm -f aqua-installer
  echo "export PATH=\$HOME/.local/share/aquaproj-aqua/bin:\$PATH" >> ~/.bashrc
fi
export PATH=$HOME/.local/share/aquaproj-aqua/bin:$PATH

# Install tools via aqua
cp -f $BEESTRAP_PATH/aqua.yaml $HOME/aqua.yaml
aqua i

# Install tools via mitamae
mitamae local $BEESTRAP_PATH/recipes/common.rb
