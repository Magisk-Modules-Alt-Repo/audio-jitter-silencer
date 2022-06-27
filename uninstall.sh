#!/system/bin/sh

# sleep 33 secs needed for settings commans to be effective in an orphan process
# and make the adaptive battery manager, adaptive connectivity and wifi suspend optimizations to be on

function waitBootCompletion()
{
    # wait for system boot completion
    local i
    for i in `seq 1 30` ; do
        if [ "`getprop sys.boot_completed`" = "1" ]; then
            break
        fi
        sleep 1.07
    done
}

function enableBatteryOptimizations()
{    
    settings delete global adaptive_battery_management_enabled
    settings delete secure adaptive_connectivity_enabled
    settings delete global wifi_suspend_optimizations_enabled
}

function restoreBackupFile()
{
    target_whitelist="/data/system/deviceidle.xml"
    
    dumpsys deviceidle disable all 1>"/dev/null" 2>&1
    sleep 1

    if [ -e "${target_whitelist}-jitter-silencer-bk" ]; then
        mv -f "${target_whitelist}-jitter-silencer-bk" "${target_whitelist}"
        
    else
        {
            echo "<?xml version='1.0' encoding='utf-8' standalone='yes' ?>"
            echo "<config>"
            echo "</config>"
        } >"${target_whitelist}"
        
    fi
    
    touch "${target_whitelist}"
    chmod 600 "$target_whitelist"
    chcon u:object_r:system_data_file:s0 "$target_whitelist"
    chown system:system "$target_whitelist"
    
    dumpsys deviceidle enable all 1>"/dev/null" 2>&1
    sleep 1
}

(((sleep 33; waitBootCompletion; restoreBackupFile; enableBatteryOptimizations) 0<&- &>"/dev/null" &) &)
