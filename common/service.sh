#!/system/bin/sh
# Please don't hardcode /magisk/modname/... ; instead, please use $MODDIR/...
# This will make your scripts compatible even if Magisk change its mount point in the future
MODDIR=${0%/*}
LOGFILE=/cache/magisk.log
MODNAME=${MODDIR#/magisk/}

log_print() {
  echo "$MODNAME: $1"
  echo "$MODNAME: $1" >> $LOGFILE
  log -p i -t "$MODNAME" "$1"
}

# This script will be executed in late_start service mode
# More info in the main Magisk thread

log_print " starting vlmcsd with log file /cache/vlmcsd.log"
$MODDIR/system/xbin/vlmcsd -j "$MODDIR/system/etc/vlmcsd.kmd" -l /cache/vlmcsd.log
