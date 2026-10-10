diff:
    #!/bin/sh -x
    diff -u -r HL2DM/ BMS/ > BMS.diff
    diff -u -r HL2DM/ HalfLife/ > HalfLife.diff
    exit 0 # OK!

# goldsrc hardcodes controller.cfg
_render_gp handler ovpath *args:
    #!/bin/sh
    [[ -d {{handler}} ]]
    export ovdir="{{handler}}/overlay/{{ovpath}}"
    mkdir -p "$ovdir"
    jinja2 template/gamepad.cfg.j2 {{args}} > "$ovdir"/controller.cfg

render:
    just _render_gp HalfLife valve     -D MOD="hl"
    just _render_gp HL2DM    hl2mp/cfg -D MOD="hl2dm"
    # just _render_gp BMS      bms/cfg   -D MOD="bms"

install_all:
    #!/bin/sh
    for d in HL2DM HalfLife; do
    (pushd $d && ./install.sh || :;)
    done
