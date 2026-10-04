#!/bin/bash

GAME_DIR=$HOME"/.local/share/Steam/steamapps/common/Half-Life 2 Deathmatch"

cp -v ./cfg/*.cfg -t "$GAME_DIR/hl2mp/cfg/"

# SERVER
cat << EOF > "$GAME_DIR/hl2mp/cfg/0.cfg"
exec gamepad
map dm_runoff
EOF
echo "> /hl2mp/cfg/0.cfg"

# CLIENTS
for i in $(seq 1 3); do
cat << EOF > "$GAME_DIR/hl2mp/cfg/$i.cfg"
exec gamepad
connect 10.99.0.1:27015
EOF
echo "> /hl2mp/cfg/$i.cfg"
done
