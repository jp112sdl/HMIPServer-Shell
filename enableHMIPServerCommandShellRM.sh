echo "SSH Mods"
FILE='/usr/local/etc/ssh/sshd_config'

LINE='X11Forwarding yes'
echo -n "$FILE - $LINE - "
if [ -f $FILE ]; then
  grep -qF -- "$LINE" "$FILE" || echo "$LINE" >> "$FILE"
else
  echo "$LINE" >> "$FILE"
fi
if [ "$?" -eq 0 ]; then echo "OK"; else echo "ERROR"; fi

LINE='PermitUserEnvironment yes'
echo -n "$FILE - $LINE - "
grep -qF -- "$LINE" "$FILE" || echo "$LINE" >> "$FILE"
if [ "$?" -eq 0 ]; then echo "OK"; else echo "ERROR"; fi

FILE='/usr/local/etc/ssh/environment'
LINE='XAUTHORITY=/usr/local/etc/ssh/.Xauthority'
echo -n "$FILE - $LINE - "
if [ -f $FILE ]; then
  grep -qF -- "$LINE" "$FILE" || echo "$LINE" >> "$FILE"
else
  echo "$LINE" >> "$FILE"
fi
if [ "$?" -eq 0 ]; then echo "OK"; else echo "ERROR"; fi

/etc/init.d/S50sshd restart

echo "Download and Extract X11 Libs..."
mount -o remount,rw /
ARCH=$(uname -m)
echo "Detected arch: $ARCH"
if [[ $ARCH == "x86_64" ]]; then 
  echo -n "xorg-xauth-1.1.2-1 - "  ; wget -qO- https://geo.mirror.pkgbuild.com/extra/os/x86_64/xorg-xauth-1.1.2-1-x86_64.pkg.tar.zst  | tar -I zstd -xf - -C / ; if [ "$?" -eq 0 ]; then echo "OK"; else echo "ERROR"; fi
  echo -n "libxext-1.3.4-4 - "     ; wget -qO- https://geo.mirror.pkgbuild.com/extra/os/x86_64/libxext-1.3.4-4-x86_64.pkg.tar.zst     | tar -I zstd -xf - -C / ; if [ "$?" -eq 0 ]; then echo "OK"; else echo "ERROR"; fi
  echo -n "libx11-1.8.1-3 - "      ; wget -qO- https://geo.mirror.pkgbuild.com/extra/os/x86_64/libx11-1.8.1-3-x86_64.pkg.tar.zst      | tar -I zstd -xf - -C / ; if [ "$?" -eq 0 ]; then echo "OK"; else echo "ERROR"; fi
  echo -n "libxrender-0.9.11-1 - " ; wget -qO- https://geo.mirror.pkgbuild.com/extra/os/x86_64/libxrender-0.9.11-1-x86_64.pkg.tar.zst | tar -I zstd -xf - -C / ; if [ "$?" -eq 0 ]; then echo "OK"; else echo "ERROR"; fi
  echo -n "libxtst-1.2.4-1 - "     ; wget -qO- https://geo.mirror.pkgbuild.com/extra/os/x86_64/libxtst-1.2.4-1-x86_64.pkg.tar.zst     | tar -I zstd -xf - -C / ; if [ "$?" -eq 0 ]; then echo "OK"; else echo "ERROR"; fi
  echo -n "libxi-1.8-1 - "         ; wget -qO- https://geo.mirror.pkgbuild.com/extra/os/x86_64/libxi-1.8-1-x86_64.pkg.tar.zst         | tar -I zstd -xf - -C / ; if [ "$?" -eq 0 ]; then echo "OK"; else echo "ERROR"; fi
  echo -n "libxcb-1.15-1 - "       ; wget -qO- https://geo.mirror.pkgbuild.com/extra/os/x86_64/libxcb-1.15-1-x86_64.pkg.tar.zst       | tar -I zstd -xf - -C / ; if [ "$?" -eq 0 ]; then echo "OK"; else echo "ERROR"; fi
  echo -n "libxau-1.0.10-1 - "     ; wget -qO- https://geo.mirror.pkgbuild.com/extra/os/x86_64/libxau-1.0.10-1-x86_64.pkg.tar.zst     | tar -I zstd -xf - -C / ; if [ "$?" -eq 0 ]; then echo "OK"; else echo "ERROR"; fi
  echo -n "libxmu-1.1.4-1 - "      ; wget -qO- https://geo.mirror.pkgbuild.com/extra/os/x86_64/libxmu-1.1.4-1-x86_64.pkg.tar.zst      | tar -I zstd -xf - -C / ; if [ "$?" -eq 0 ]; then echo "OK"; else echo "ERROR"; fi
  echo -n "libxdmcp-1.1.3-4 - "    ; wget -qO- https://geo.mirror.pkgbuild.com/extra/os/x86_64/libxdmcp-1.1.3-4-x86_64.pkg.tar.zst    | tar -I zstd -xf - -C / ; if [ "$?" -eq 0 ]; then echo "OK"; else echo "ERROR"; fi
  echo -n "libbsd-0.11.7-1 - "     ; wget -qO- https://geo.mirror.pkgbuild.com/extra/os/x86_64/libbsd-0.11.7-1-x86_64.pkg.tar.zst     | tar -I zstd -xf - -C / ; if [ "$?" -eq 0 ]; then echo "OK"; else echo "ERROR"; fi          
  echo -n "libmd-1.0.4-1 - "       ; wget -qO- https://geo.mirror.pkgbuild.com/community/os/x86_64/libmd-1.0.4-1-x86_64.pkg.tar.zst   | tar -I zstd -xf - -C / ; if [ "$?" -eq 0 ]; then echo "OK"; else echo "ERROR"; fi
elif [[ $ARCH == "aarch64" ]]; then
  echo -n "xorg-xauth-1.1.2-1 - "  ; wget -qO- http://mirror.archlinuxarm.org/aarch64/extra/xorg-xauth-1.1.2-1-aarch64.pkg.tar.xz  | tar xJf - -C / ; if [ "$?" -eq 0 ]; then echo "OK"; else echo "ERROR"; fi
  echo -n "libxext-1.3.4-4 - "     ; wget -qO- http://mirror.archlinuxarm.org/aarch64/extra/libxext-1.3.4-4-aarch64.pkg.tar.xz     | tar xJf - -C / ; if [ "$?" -eq 0 ]; then echo "OK"; else echo "ERROR"; fi
  echo -n "libx11-1.8.1-3 - "      ; wget -qO- http://mirror.archlinuxarm.org/aarch64/extra/libx11-1.8.1-3-aarch64.pkg.tar.xz      | tar xJf - -C / ; if [ "$?" -eq 0 ]; then echo "OK"; else echo "ERROR"; fi
  echo -n "libxrender-0.9.11-1 - " ; wget -qO- http://mirror.archlinuxarm.org/aarch64/extra/libxrender-0.9.11-1-aarch64.pkg.tar.xz | tar xJf - -C / ; if [ "$?" -eq 0 ]; then echo "OK"; else echo "ERROR"; fi
  echo -n "libxtst-1.2.4-1 - "     ; wget -qO- http://mirror.archlinuxarm.org/aarch64/extra/libxtst-1.2.4-1-aarch64.pkg.tar.xz     | tar xJf - -C / ; if [ "$?" -eq 0 ]; then echo "OK"; else echo "ERROR"; fi
  echo -n "libxi-1.8-1 - "         ; wget -qO- http://mirror.archlinuxarm.org/aarch64/extra/libxi-1.8-1-aarch64.pkg.tar.xz         | tar xJf - -C / ; if [ "$?" -eq 0 ]; then echo "OK"; else echo "ERROR"; fi
  echo -n "libxcb-1.15-1 - "       ; wget -qO- http://mirror.archlinuxarm.org/aarch64/extra/libxcb-1.15-1-aarch64.pkg.tar.xz       | tar xJf - -C / ; if [ "$?" -eq 0 ]; then echo "OK"; else echo "ERROR"; fi
  echo -n "libxau-1.0.10-1 - "     ; wget -qO- http://mirror.archlinuxarm.org/aarch64/extra/libxau-1.0.10-1-aarch64.pkg.tar.xz     | tar xJf - -C / ; if [ "$?" -eq 0 ]; then echo "OK"; else echo "ERROR"; fi
  echo -n "libxmu-1.1.4-1 - "      ; wget -qO- http://mirror.archlinuxarm.org/aarch64/extra/libxmu-1.1.4-1-aarch64.pkg.tar.xz      | tar xJf - -C / ; if [ "$?" -eq 0 ]; then echo "OK"; else echo "ERROR"; fi
  echo -n "libxdmcp-1.1.3-4 - "    ; wget -qO- http://mirror.archlinuxarm.org/aarch64/extra/libxdmcp-1.1.3-4-aarch64.pkg.tar.xz    | tar xJf - -C / ; if [ "$?" -eq 0 ]; then echo "OK"; else echo "ERROR"; fi
  echo -n "libbsd-0.11.7-1 - "     ; wget -qO- http://mirror.archlinuxarm.org/aarch64/extra/libbsd-0.11.7-1-aarch64.pkg.tar.xz     | tar xJf - -C / ; if [ "$?" -eq 0 ]; then echo "OK"; else echo "ERROR"; fi
  echo -n "libmd-1.0.4-1 - "       ; wget -qO- http://mirror.archlinuxarm.org/aarch64/community/libmd-1.0.4-1-aarch64.pkg.tar.xz   | tar xJf - -C / ; if [ "$?" -eq 0 ]; then echo "OK"; else echo "ERROR"; fi
fi
mount -o remount,ro /

echo "Pre-Installation done"
echo "now reconnect SSH session with X11 (ssh -X ...)"
echo "and run callHMIPServerCommandShell.sh"
