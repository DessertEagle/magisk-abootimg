###    customize.sh for abootimg-magisk    ###
###            by DessertEagle             ###

for DIR in /system/bin /system/xbin; do
   [ -d "$DIR" ] && BINDIR="$DIR" && ui_print "- Detected $DIR";
done && unset DIR

[ -d "$BINDIR" ] || abort "! No usable bin directory, something is not right"

ui_print "- Installing to $BINDIR"
mkdir -p $MODPATH/$BINDIR || abort "! Failed to create $MODPATH/$BINDIR"
mv $MODPATH/abootimg-$ARCH $MODPATH/$BINDIR/abootimg || abort "! Unsupported CPU architecture: $ARCH"
mv $MODPATH/abootimg-*-initrd $MODPATH/$BINDIR || abort "! Failed to move script files"
ui_print "- Setting permissions"
for FILE in $MODPATH/$BINDIR/abootimg*; do
   set_perm $FILE root shell 755 || abort "! Failed to set permissions for $FILE"; done && unset FILE
