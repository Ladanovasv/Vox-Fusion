#!/bin/bash
set -e

# Create link if not exist
ln -s /usr/local/lib/python3.8/dist-packages/open3d/libGL.so.1 /usr/lib/libGL.so.1 || true

exec "$@"