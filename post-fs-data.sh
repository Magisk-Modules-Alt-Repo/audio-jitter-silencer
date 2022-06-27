#!/system/bin/sh

MODDIR=${0%/*}
RUN_ONCE="$MODDIR/run_once"

if [ -e "$RUN_ONCE" ]; then
    exit 0
fi

new_whitelist="$MODDIR/doze-whitelist/audio-deviceidle.xml"
target_whitelist="/data/system/deviceidle.xml"

function mergeWhitelists() {
    if [ $# -eq 3 ]; then
        echo "<?xml version='1.0' encoding='utf-8' standalone='yes' ?>" >"$3"
        echo "<config>" >>"$3"

        { grep  '<wl' <"$1"; grep  '<wl' <"$2"; } | sort | uniq >>"$3"

        echo "</config>" >>"$3"
        return 0
    else
        return 1
    fi
}

dumpsys deviceidle disable all 1>"/dev/null" 2>&1
sleep 1

# make a backup copy and merge my whitelist into the target one
if [ -e "${target_whitelist}-jitter-silencer-bk" ]; then
    rm -f "${target_whitelist}"
    mergeWhitelists "${target_whitelist}-jitter-silencer-bk" "$new_whitelist" "$target_whitelist"
    
elif [ -e "${target_whitelist}" ]; then
    mv "${target_whitelist}" "${target_whitelist}-jitter-silencer-bk"
    mergeWhitelists "${target_whitelist}-jitter-silencer-bk" "$new_whitelist" "$target_whitelist"
    
else
    cp -f "$new_whitelist" "$target_whitelist"
    
fi

chmod 600 "$target_whitelist"
chcon u:object_r:system_data_file:s0 "$target_whitelist"
chown system:system "$target_whitelist"

dumpsys deviceidle enable all 1>"/dev/null" 2>&1
sleep 1
