#!/usr/bin/env bash
set -euo pipefail
[[ ${DEBUG-} =~ ^1|yes|true$ ]] && set -o xtrace

# Update the package list and upgrade all packages
sudo apt update
sudo apt upgrade -y

# Install Staship prompt
curl -sS https://starship.rs/install.sh | sh -s -- -y
echo 'eval "$(starship init bash)"' >> ~/.bashrc
source ~/.bashrc

# Install adr-tools, see https://github.com/npryce/adr-tools
git clone https://github.com/npryce/adr-tools.git --depth 1 $HOME/.adr-tools
echo 'export PATH=$PATH:$HOME/.adr-tools/src' >> $HOME/.bashrc

printf "\n\n\033[1m✅ DevContainer was successfully created!\033[0m\n\n"