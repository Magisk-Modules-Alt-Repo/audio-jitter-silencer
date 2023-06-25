#!/system/bin/sh

# sleep 33 secs needed for "settings" commands to become effective
# and make the adaptive battery manager, adaptive connectivity and wifi suspend optimizations to be off

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

function disableBatteryOptimizations()
{
    settings put global adaptive_battery_management_enabled 0
    settings put secure adaptive_charging_enabled 0
    settings put secure adaptive_connectivity_enabled 0
    settings put global wifi_suspend_optimizations_enabled 0
}

(((sleep 33; waitBootCompletion; disableBatteryOptimizations)  0<&- &>"/dev/null" &) &)
