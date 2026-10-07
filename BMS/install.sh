#!/bin/bash

GAME_DIR=$HOME"/.local/share/Steam/steamapps/common/Black Mesa"
CFG_DIR=${CFG_DIR:-"$GAME_DIR/bms/cfg/"}

START_MAP="dm_stalkyard"

cp -v ./cfg/*.cfg -t "$CFG_DIR"

# SERVER
cat << EOF > "$CFG_DIR/0.cfg"
exec gamepad
map $START_MAP
EOF
echo "> cfg/0.cfg"

# CLIENTS
for i in $(seq 1 3); do
cat << EOF > "$CFG_DIR/$i.cfg"
exec gamepad
connect 10.99.0.1:27015
EOF
echo "> cfg/$i.cfg"
done

ln -s $(pwd) ~/.local/share/partydeck/handlers/ 2>/dev/null
