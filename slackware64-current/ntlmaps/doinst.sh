# Handle the incoming configuration files:
config() {
  for infile in $1; do
  NEW="$infile"
  OLD="$(dirname $NEW)/$(basename $NEW .new)"
  # If there's no config file by that name, mv it over:
  if [ ! -e $OLD ]; then
    mv $NEW $OLD
  elif [ "`cat $OLD | md5sum`" = "`cat $NEW | md5sum`" ]; then
    # toss the redundant copy
    rm $NEW
  fi
  # Otherwise, we leave the .new copy for the admin to consider...
  done
}
if [ -e etc/rc.d/rc.ntlmaps ]; then
  cp -a etc/rc.d/rc.ntlmaps etc/rc.d/rc.ntlmaps.new.incoming
  cat etc/rc.d/rc.ntlmaps.new > etc/rc.d/rc.ntlmaps.new.incoming
  mv etc/rc.d/rc.ntlmaps.new.incoming etc/rc.d/rc.ntlmaps.new
fi

config etc/ntlmaps/server.cfg.new
config etc/rc.d/rc.ntlmaps.new
