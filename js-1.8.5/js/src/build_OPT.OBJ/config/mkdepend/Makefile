#
# ***** BEGIN LICENSE BLOCK *****
# Version: MPL 1.1/GPL 2.0/LGPL 2.1
#
# The contents of this file are subject to the Mozilla Public License Version
# 1.1 (the "License"); you may not use this file except in compliance with
# the License. You may obtain a copy of the License at
# http://www.mozilla.org/MPL/
#
# Software distributed under the License is distributed on an "AS IS" basis,
# WITHOUT WARRANTY OF ANY KIND, either express or implied. See the License
# for the specific language governing rights and limitations under the
# License.
#
# The Original Code is mozilla.org code.
#
# The Initial Developer of the Original Code is
# Netscape Communications Corporation.
# Portions created by the Initial Developer are Copyright (C) 1998
# the Initial Developer. All Rights Reserved.
#
# Contributor(s):
#
# Alternatively, the contents of this file may be used under the terms of
# either of the GNU General Public License Version 2 or later (the "GPL"),
# or the GNU Lesser General Public License Version 2.1 or later (the "LGPL"),
# in which case the provisions of the GPL or the LGPL are applicable instead
# of those above. If you wish to allow use of your version of this file only
# under the terms of either the GPL or the LGPL, and not to allow others to
# use your version of this file under the terms of the MPL, indicate your
# decision by deleting the provisions above and replace them with the notice
# and other provisions required by the GPL or the LGPL. If you do not delete
# the provisions above, a recipient may use your version of this file under
# the terms of any one of the MPL, the GPL or the LGPL.
#
# ***** END LICENSE BLOCK *****

DEPTH		= ../..
topsrcdir	= ../../..
srcdir		= ../../../config/mkdepend
VPATH		= ../../../config/mkdepend

include $(DEPTH)/config/autoconf.mk

USE_STATIC_LIBS = 1

MODULE		 = mkdepend
HOST_PROGRAM	 = mkdepend$(BIN_SUFFIX)
ifdef GNU_CC
MODULE_OPTIMIZE_FLAGS = -O3
else
ifeq ($(OS_ARCH),SunOS)
MODULE_OPTIMIZE_FLAGS = -fast
endif
endif

ifeq ($(OS_ARCH),WINNT)
ifndef GNU_CC
MODULE_OPTIMIZE_FLAGS = -Ox
endif
endif

HOST_CSRCS	= \
		cppsetup.c \
		ifparser.c \
		include.c \
		main.c \
		parse.c \
		pr.c \
		$(NULL)

include $(topsrcdir)/config/rules.mk

HOST_CFLAGS	+= -DINCLUDEDIR=\"/usr/include\" -DOBJSUFFIX=\".$(OBJ_SUFFIX)\"

ifdef GNU_CC
_GCCDIR		= $(shell $(CC) -print-file-name=include)
HOST_CFLAGS	+= -DPREINCDIR=\"$(_GCCDIR)\"
endif

export:: $(HOST_PROGRAM)

$(HOST_OBJS): def.h ifparser.h imakemdep.h
