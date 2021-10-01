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

#
# Run
#
run() {
  if ! grep -q "[statesync]" "${CONFIG}"; then
    apply_patch
  else
    echo -e 'The [statesync] config block already exists. Exiting.'
    exit 0
  fi

  echo -e 'Update complete.'
}

run
