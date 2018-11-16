#!/bin/bash

set -eox pipefail

exec keosd --http-server-address=0.0.0.0:5555
