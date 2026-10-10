#!/bin/bash

# GAME_DIR="$HOME/.local/share/Steam/steamapps/common/Half-Life"
GAME_DIR="./overlay"
CFG_DIR=${CFG_DIR:-"$GAME_DIR/valve"}

# SERVER PRERENDERED

# CLIENTS
for i in $(seq 1 3); do
cat << EOF > "$CFG_DIR/$i.cfg"
developer 1
name Player$i
echo "I AM PLAYER $i"
port 27010
connect 10.99.0.1:27015
exec controller.cfg
EOF
echo "> cfg/$i.cfg"
done

# for i in config controller; do
# cat << EOF > "$CFG_DIR/$i.cfg"
# echo $i stubbed
# EOF
# echo "> cfg/$i.cfg"
# done

ln -s $(pwd) ~/.local/share/partydeck/handlers/ 2>/dev/null
