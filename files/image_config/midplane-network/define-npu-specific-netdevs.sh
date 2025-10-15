#!/bin/bash

set -e

if /bin/bash /usr/local/bin/is-npu-or-dpu.sh -n; then
    ln -sf /usr/lib/systemd/network/bridge-midplane.netdev /etc/systemd/network/bridge-midplane.netdev
    ln -sf /usr/lib/systemd/network/dummy-midplane.netdev  /etc/systemd/network/dummy-midplane.netdev
fi
