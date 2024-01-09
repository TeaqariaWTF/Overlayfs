# kakathic
MODP="${0%/*}"

# Check boot
while true; do
[ "$(getprop sys.boot_completed)" == 1 ] && break || sleep 1
done
# end

if [ -e $MODP/zption/rw ];then
while true; do
# mount rw overlayfs
for TV in $(cat $MODP/partition); do
mount -o rw,remount $TV
done
[ "$(mount -t overlay | grep -m1 kakathic | grep -cm1 'rw')" == 1 ] && break
[ $kakatest -gt 100 ] && break || kakatest=$(($kakatest + 1))
done
fi
