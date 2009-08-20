#!/bin/sh
#
# Copyright (c) 2002-2009
#         The Xfce development team. All rights reserved.
#
# Written for Xfce by Benedikt Meurer <benny@xfce.org>
#                 and Brian Tarricone <brian@tarricone.org>.
#

export XDT_AUTOGEN_REQUIRED_VERSION="4.7.0"

(type xdt-autogen) >/dev/null 2>&1 || {
  cat >&2 <<EOF
autogen.sh: You don't seem to have the Xfce development tools (at least
            version $XDT_REQURED_VERSION) installed on your system, which
            are required to build this software.
            Please install the xfce4-dev-tools package first; it is available
            from http://www.xfce.org/.
EOF
  exit 1
}

# Build changelog
if test -d .git; then
  git log --pretty=short --shortstat 2> /dev/null > ChangeLog.tmp \
  && mv ChangeLog.tmp ChangeLog
fi
if test ! -f ChangeLog; then
  echo "A git checkout and 'git log' is required to generate this file." > ChangeLog
fi

exec xdt-autogen "$@"

# vi:set ts=2 sw=2 et ai:
