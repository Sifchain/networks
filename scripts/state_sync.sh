#!/usr/bin/env sh
#
# State sync fix.
#

CONFIG="${HOME}"/.sifnoded/config/config.toml
PATCH=https://raw.githubusercontent.com/Sifchain/networks/master/config/sifchain-1/state_sync.patch

#
# Apply patch.
#
apply_patch() {
  wget -q -O - "${PATCH}" >> "${CONFIG}"
}

if ! grep -q "[statesync]" "${CONFIG}"; then
  echo 'statesync already exists'
  exit 0
fi

apply_patch
