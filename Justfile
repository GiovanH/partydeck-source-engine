diff:
    #!/bin/sh -x
    diff -u -r HL2DM/ BMS/ > BMS.diff
    diff -u -r HL2DM/ HalfLife/ > HalfLife.diff
    exit 0

render:
    jinja2 template/gamepad.cfg.j2 -D ENGINE="goldsrc" -D MOD="hl" > HalfLife/cfg/gamepad.cfg
    jinja2 template/gamepad.cfg.j2 -D ENGINE="source" -D MOD="hl2dm" > HL2DM/cfg/gamepad.cfg
    jinja2 template/gamepad.cfg.j2 -D ENGINE="source" -D MOD="bms" > BMS/cfg/gamepad.cfg

install_all:
    #!/bin/sh
    for d in HL2DM BMS HalfLife; do
    (pushd $d && ./install.sh || :;)
    done
