#!/bin/bash

# GAME_DIR="$HOME/.local/share/Steam/steamapps/common/Half-Life"
GAME_DIR="./overlay"
CFG_DIR=${CFG_DIR:-"$GAME_DIR/valve"}

# SERVER PRERENDERED

# CLIENTS
for i in $(seq 1 3); do
cat << EOF > "$CFG_DIR/$i.cfg"
exec gamepad.cfg
port 27010
name Player$i
connect 10.99.0.1:27015
EOF
echo "> cfg/$i.cfg"
done

ln -s $(pwd) ~/.local/share/partydeck/handlers/ 2>/dev/null
