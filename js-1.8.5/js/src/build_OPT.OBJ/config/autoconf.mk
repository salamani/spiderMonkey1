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
# The Original Code is this file as it was released upon August 6, 1998.
#
# The Initial Developer of the Original Code is
# Christopher Seawood.
# Portions created by the Initial Developer are Copyright (C) 1998
# the Initial Developer. All Rights Reserved.
#
# Contributor(s):
#   Benjamin Smedberg <benjamin@smedbergs.us>
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

# A netscape style .mk file for autoconf builds

INCLUDED_AUTOCONF_MK = 1
USE_AUTOCONF 	= 1
MOZILLA_CLIENT	= 1
target          = s390x-ibm-linux-gnu
ac_configure_args =  --prefix=/usr
BUILD_MODULES	= @BUILD_MODULES@
MOZILLA_VERSION = 

MOZ_BUILD_APP = @MOZ_BUILD_APP@
MOZ_APP_NAME	= 
MOZ_APP_DISPLAYNAME = 
MOZ_APP_VERSION = 

MOZ_PKG_SPECIAL = 

prefix		= /usr
exec_prefix	= ${prefix}
bindir		= ${exec_prefix}/bin
includedir	= ${prefix}/include
libdir		= ${exec_prefix}/lib
datadir		= ${prefix}/share
mandir		= ${prefix}/man

installdir	= $(libdir)/$(MOZ_APP_NAME)-$(MOZ_APP_VERSION)
sdkdir		= $(libdir)/$(MOZ_APP_NAME)-devel-$(MOZ_APP_VERSION)

TOP_DIST	= dist
ifneq (,$(filter /%,$(TOP_DIST)))
DIST		= $(TOP_DIST)
else
DIST		= $(DEPTH)/$(TOP_DIST)
endif

MOZ_JS_LIBS		   = -L$(libdir) -lmozjs

MOZ_SYNC_BUILD_FILES = 

MOZ_DEBUG	= 
MOZ_DEBUG_SYMBOLS = 
MOZ_DEBUG_ENABLE_DEFS		= -DDEBUG -D_DEBUG -DTRACING
MOZ_DEBUG_DISABLE_DEFS	= -DNDEBUG -DTRIMMED
MOZ_DEBUG_FLAGS	= -g
MOZ_DEBUG_LDFLAGS=
MOZ_EXTENSIONS  = @MOZ_EXTENSIONS@
MOZ_JSDEBUGGER  = @MOZ_JSDEBUGGER@
MOZ_LEAKY	= 
MOZ_MEMORY      = 
MOZ_PROFILING   = 
MOZ_JPROF       = 
MOZ_SHARK       = 
MOZ_CALLGRIND   = 
MOZ_VTUNE       = 
JS_HAS_CTYPES = 
DEHYDRA_PATH    = 

NS_TRACE_MALLOC = 
INCREMENTAL_LINKER = 
MACOSX_DEPLOYMENT_TARGET = 
BUILD_STATIC_LIBS = 
ENABLE_TESTS	= 1

TAR=@TAR@

RM = rm -f

# The MOZ_UI_LOCALE var is used to build a particular locale. Do *not*
# use the var to change any binary files. Do *not* use this var unless you
# write rules for the "clean-locale" and "locale" targets.
MOZ_UI_LOCALE = 

MOZ_COMPONENTS_VERSION_SCRIPT_LDFLAGS = -Wl,--version-script -Wl,$(BUILD_TOOLS)/gnu-ld-scripts/components-version-script
MOZ_COMPONENT_NSPR_LIBS=-L$(LIBXUL_DIST)/bin $(NSPR_LIBS)

MOZ_FIX_LINK_PATHS=-Wl,-rpath-link,$(LIBXUL_DIST)/bin -Wl,-rpath-link,$(prefix)/lib

XPCOM_FROZEN_LDOPTS=@XPCOM_FROZEN_LDOPTS@
XPCOM_LIBS=@XPCOM_LIBS@
MOZ_TIMELINE=

ENABLE_STRIP	= 
PKG_SKIP_STRIP	= 

MOZ_POST_DSO_LIB_COMMAND = 
MOZ_POST_PROGRAM_COMMAND = 

MOZ_BUILD_ROOT             = /scratch/ecos0034/ravi_2/sl1-sp4/js-1.8.5/js/src/build_OPT.OBJ

MOZ_NATIVE_NSPR = 

CROSS_COMPILE   = 

OS_CPPFLAGS	= 
OS_CFLAGS	= $(OS_CPPFLAGS) -Wall -W -Wno-unused -Wpointer-arith -Wcast-align -W -pedantic -Wno-long-long -fno-strict-aliasing -pthread -pipe
OS_CXXFLAGS	= $(OS_CPPFLAGS) -fno-rtti -fno-exceptions -Wall -Wpointer-arith -Woverloaded-virtual -Wsynth -Wno-ctor-dtor-privacy -Wno-non-virtual-dtor -Wcast-align -Wno-invalid-offsetof -Wno-variadic-macros -Werror=return-type -pedantic -Wno-long-long -fno-strict-aliasing -pthread -pipe
OS_LDFLAGS	= -lpthread 

OS_COMPILE_CFLAGS = $(OS_CPPFLAGS) -include $(DEPTH)/js-confdefs.h -DMOZILLA_CLIENT $(filter-out %/.pp,-MD -MF $(MDDEPDIR)/$(basename $(@F)).pp)
OS_COMPILE_CXXFLAGS = $(OS_CPPFLAGS) -DMOZILLA_CLIENT -include $(DEPTH)/js-confdefs.h $(filter-out %/.pp,-MD -MF $(MDDEPDIR)/$(basename $(@F)).pp)

OS_INCLUDES	= $(NSPR_CFLAGS)
OS_LIBS		= -ldl 
ACDEFINES	=  -DX_DISPLAY_MISSING=1 -DHAVE_64BIT_OS=1 -DD_INO=d_ino -DSTDC_HEADERS=1 -DHAVE_SSIZE_T=1 -DHAVE_ST_BLKSIZE=1 -DHAVE_SIGINFO_T=1 -DJS_HAVE_STDINT_H=1 -DJS_BYTES_PER_WORD=8 -DJS_BITS_PER_WORD_LOG2=6 -DJS_ALIGN_OF_POINTER=8 -DJS_BYTES_PER_DOUBLE=8 -DHAVE_INT16_T=1 -DHAVE_INT32_T=1 -DHAVE_INT64_T=1 -DHAVE_UINT=1 -DHAVE_UNAME_DOMAINNAME_FIELD=1 -DHAVE_VISIBILITY_HIDDEN_ATTRIBUTE=1 -DHAVE_VISIBILITY_ATTRIBUTE=1 -DHAVE_DIRENT_H=1 -DHAVE_GETOPT_H=1 -DHAVE_SYS_BITYPES_H=1 -DHAVE_MEMORY_H=1 -DHAVE_UNISTD_H=1 -DHAVE_GNU_LIBC_VERSION_H=1 -DHAVE_NL_TYPES_H=1 -DHAVE_MALLOC_H=1 -DHAVE_SYS_STATVFS_H=1 -DHAVE_SYS_STATFS_H=1 -DHAVE_SYS_VFS_H=1 -DHAVE_SYS_MOUNT_H=1 -DHAVE_SYS_QUOTA_H=1 -DHAVE_LINUX_QUOTA_H=1 -DNEW_H=\<new\> -DHAVE_SYS_CDEFS_H=1 -DHAVE_DLOPEN=1 -DHAVE_DLADDR=1 -D_REENTRANT=1 -DHAVE_FCHMOD=1 -DHAVE_FLOCKFILE=1 -DHAVE_GETC_UNLOCKED=1 -DHAVE_GETPAGESIZE=1 -DHAVE_LCHOWN=1 -DHAVE_LOCALTIME_R=1 -DHAVE_LSTAT64=1 -DHAVE_MEMMOVE=1 -DHAVE_RANDOM=1 -DHAVE_SBRK=1 -DHAVE_SNPRINTF=1 -DHAVE_STAT64=1 -DHAVE_STATVFS=1 -DHAVE_STATVFS64=1 -DHAVE_STRERROR=1 -DHAVE_STRTOK_R=1 -DHAVE_TRUNCATE64=1 -DHAVE_CLOCK_MONOTONIC=1 -DHAVE_WCRTOMB=1 -DHAVE_MBRTOWC=1 -DHAVE_RES_NINIT=1 -DHAVE_GNU_GET_LIBC_VERSION=1 -DHAVE_ICONV=1 -DVA_COPY=va_copy -DHAVE_VA_COPY=1 -DHAVE_VA_LIST_AS_ARRAY=1 -DHAVE_CPP_EXPLICIT=1 -DHAVE_CPP_TYPENAME=1 -DHAVE_CPP_MODERN_SPECIALIZE_TEMPLATE_SYNTAX=1 -DHAVE_CPP_PARTIAL_SPECIALIZATION=1 -DHAVE_CPP_ACCESS_CHANGING_USING=1 -DHAVE_CPP_AMBIGUITY_RESOLVING_USING=1 -DHAVE_CPP_NAMESPACE_STD=1 -DHAVE_CPP_UNAMBIGUOUS_STD_NOTEQUAL=1 -DHAVE_CPP_NEW_CASTS=1 -DHAVE_CPP_DYNAMIC_CAST_TO_VOID_PTR=1 -DNEED_CPP_UNUSED_IMPLEMENTATIONS=1 -DHAVE_THREAD_TLS_KEYWORD=1 -DMALLOC_H=\<malloc.h\> -DHAVE_STRNDUP=1 -DHAVE_POSIX_MEMALIGN=1 -DHAVE_MEMALIGN=1 -DHAVE_VALLOC=1 -DHAVE_I18N_LC_MESSAGES=1 -DHAVE_LOCALECONV=1 -DNS_ALWAYS_INLINE=__attribute__\(\(always_inline\)\) -DNS_ATTR_MALLOC=__attribute__\(\(malloc\)\) -DNS_WARN_UNUSED_RESULT=__attribute__\(\(warn_unused_result\)\) -DNS_NORETURN=__attribute__\(\(noreturn\)\) -DHAVE___CXA_DEMANGLE=1 -DHAVE__UNWIND_BACKTRACE=1 -DHAVE_TM_ZONE_TM_GMTOFF=1 -DCPP_THROW_NEW=throw\(\) -DEDITLINE=1 -DMOZ_DLL_SUFFIX=\".so\" -DHAVE_POSIX_FALLOCATE=1 -DXP_UNIX=1 -DUNIX_ASYNC_DNS=1 -DHAVE_SETLOCALE=1 -DHAVE_LOCALECONV=1 

WARNINGS_AS_ERRORS = -Werror

MOZ_OPTIMIZE	= 1
MOZ_OPTIMIZE_FLAGS = -Os -freorder-blocks -fomit-frame-pointer 
MOZ_OPTIMIZE_LDFLAGS = 
MOZ_OPTIMIZE_SIZE_TWEAK = 

MOZ_RTTI_FLAGS_ON = -frtti
MOZ_EXCEPTIONS_FLAGS_ON = -fexceptions

MOZ_PROFILE_GUIDED_OPTIMIZE_DISABLE = 
PROFILE_GEN_CFLAGS = 
PROFILE_GEN_LDFLAGS = 
PROFILE_USE_CFLAGS = 
PROFILE_USE_LDFLAGS = 

WIN_TOP_SRC	= 
CYGWIN_WRAPPER	= 
AS_PERL         = 
CYGDRIVE_MOUNT	= 
AR		= ar
AR_FLAGS	= cr $@
AR_EXTRACT	= $(AR) x
AR_LIST		= $(AR) t
AR_DELETE	= $(AR) d
AS		= $(CC)
ASFLAGS		=  -fPIC
AS_DASH_C_FLAG	= -c
LD		= ld
RC		= 
RCFLAGS		= 
WINDRES		= :
IMPLIB		= 
FILTER		= 
BIN_FLAGS	= 
_MSC_VER	= 

DLL_PREFIX	= lib
LIB_PREFIX	= lib
OBJ_SUFFIX	= o
LIB_SUFFIX	= a
DLL_SUFFIX	= .so
BIN_SUFFIX	= 
ASM_SUFFIX	= s
IMPORT_LIB_SUFFIX = 
USE_N32		= 
HAVE_64BIT_OS	= 1

# Temp hack.  It is not my intention to leave this crap in here for ever.
# Im talking to fur right now to solve the problem without introducing 
# NS_USE_NATIVE to the build system -ramiro.
NS_USE_NATIVE = 

CC		    = gcc
CXX		    = c++

CC_VERSION	= gcc version 4.3.4 [gcc-4_3-branch revision 152973] (SUSE Linux) 
CXX_VERSION	= gcc version 4.3.4 [gcc-4_3-branch revision 152973] (SUSE Linux) 

GNU_AS		= 1
GNU_LD		= 1
GNU_CC		= 1
GNU_CXX		= 1
HAVE_GCC3_ABI	= 1
INTEL_CC	= 
INTEL_CXX	= 

HOST_CC		= $(CC)
HOST_CXX	= $(CXX)
HOST_CFLAGS	= $(CFLAGS) -DXP_UNIX
HOST_CXXFLAGS	= $(CXXFLAGS)
HOST_LDFLAGS	= $(LDFLAGS)
HOST_OPTIMIZE_FLAGS = -O3
HOST_NSPR_MDCPUCFG = \"md/_linux.cfg\"
HOST_AR		= $(AR)
HOST_AR_FLAGS	= $(AR_FLAGS)
HOST_LD		= 
HOST_RANLIB	= $(RANLIB)
HOST_BIN_SUFFIX	= 

HOST_OS_ARCH	= Linux
host_cpu	= s390x
host_vendor	= ibm
host_os		= linux-gnu

TARGET_NSPR_MDCPUCFG = \"md/_linux.cfg\"
TARGET_CPU	= s390x
TARGET_VENDOR	= ibm
TARGET_OS	= linux-gnu
TARGET_MD_ARCH	= unix
TARGET_XPCOM_ABI = s390x-gcc3

AUTOCONF	= /usr/bin/autoconf
PERL		= /usr/bin/perl
PYTHON		= /usr/bin/python2.6
RANLIB		= ranlib
UNZIP		= /usr/bin/unzip
ZIP		= /usr/bin/zip
XARGS		= /usr/bin/xargs
STRIP		= strip
DOXYGEN		= :
PBBUILD_BIN	= 
SDP		= 
NSINSTALL_BIN	= 

NSPR_CONFIG	= 
NSPR_CFLAGS	= 
NSPR_LIBS	= 

USE_DEPENDENT_LIBS = 1

JS_NATIVE_EDITLINE = 1
JS_DISABLE_SHELL   = 
EDITLINE_LIBS      = $(DEPTH)/editline/$(LIB_PREFIX)editline.$(LIB_SUFFIX)

# MKSHLIB_FORCE_ALL is used to force the linker to include all object
# files present in an archive. MKSHLIB_UNFORCE_ALL reverts the linker
# to normal behavior. Makefile's that create shared libraries out of
# archives use these flags to force in all of the .o files in the
# archives into the shared library.
WRAP_MALLOC_LIB         = 
WRAP_MALLOC_CFLAGS      = 
DSO_CFLAGS              = 
DSO_PIC_CFLAGS          = -fPIC
MKSHLIB                 = $(CXX) $(CXXFLAGS) $(DSO_PIC_CFLAGS) $(DSO_LDOPTS) -Wl,-h,$@ -o $@
MKCSHLIB                = $(CC) $(CFLAGS) $(DSO_PIC_CFLAGS) $(DSO_LDOPTS) -Wl,-h,$@ -o $@
MKSHLIB_FORCE_ALL       = -Wl,--whole-archive
MKSHLIB_UNFORCE_ALL     = -Wl,--no-whole-archive
DSO_LDOPTS              = -shared -Wl,-z,defs
DLL_SUFFIX              = .so

NO_LD_ARCHIVE_FLAGS     = 

MOZ_TOOLKIT_REGISTRY_CFLAGS = \
	$(TK_CFLAGS)

MOZ_NATIVE_MAKEDEPEND	= 

export CL_INCLUDES_PREFIX = 

MOZ_AUTO_DEPS	= 1
COMPILER_DEPEND = 1
MDDEPDIR        := .deps
CC_WRAPPER = 
CXX_WRAPPER = 

MOZ_DEMANGLE_SYMBOLS = 

# XXX - these need to be cleaned up and have real checks added -cls
CM_BLDTYPE=dbg
AWT_11=1
OS_TARGET=Linux
OS_ARCH=Linux
OS_RELEASE=3.0.101-0.47.71-default
OS_TEST=s390x
CPU_ARCH=s390x
INTEL_ARCHITECTURE=

# For Solaris build
SOLARIS_SUNPRO_CC = 
SOLARIS_SUNPRO_CXX = 

# For AIX build
AIX_OBJMODEL = 

# For OS/2 build
MOZ_OS2_TOOLS = 
MOZ_OS2_HIGH_MEMORY = 1

MOZILLA_OFFICIAL = 

# Win32 options
MOZ_BROWSE_INFO	= 
MOZ_TOOLS_DIR	= 
MOZ_QUANTIFY	= 
MSMANIFEST_TOOL = 
WIN32_REDIST_DIR = 
MOZ_MEMORY_LDFLAGS = 

# Codesighs tools option, enables win32 mapfiles.
MOZ_MAPINFO	= 

WINCE		= 
WINCE_WINDOWS_MOBILE = 

QEMU_CANT_RUN_JS_SHELL = 

MACOS_SDK_DIR	= 
NEXT_ROOT	= 
GCC_VERSION	= 4.3.4
XCODEBUILD_VERSION= 
HAS_XCODE_2_1	= 
UNIVERSAL_BINARY= 
HAVE_DTRACE= 

VISIBILITY_FLAGS = -I$(DIST)/system_wrappers_js -include $(topsrcdir)/config/gcc_hidden.h
WRAP_SYSTEM_INCLUDES = 1

ENABLE_TRACEJIT = 
ENABLE_METHODJIT = 
NANOJIT_ARCH = 
HAVE_ARM_SIMD= 

JS_SHARED_LIBRARY = 1
HAVE_LINUX_PERF_EVENT_H = 1

# We only want to do the pymake sanity on Windows, other os's can cope
ifeq (,$(filter-out WINNT WINCE,$(HOST_OS_ARCH)))
# Ensure invariants between GNU Make and pymake
# Checked here since we want the sane error in a file that
# actually can be found regardless of path-style.
ifeq (_:,$(.PYMAKE)_$(findstring :,$(srcdir)))
$(error Windows-style srcdir being used with GNU make. Did you mean to run $(topsrcdir)/build/pymake/make.py instead? [see-also: https://developer.mozilla.org/en/Gmake_vs._Pymake])
endif
ifeq (1_a,$(.PYMAKE)_$(firstword a$(subst /, ,$(srcdir))))
$(error MSYS-style srcdir being used with Pymake. Did you mean to run GNU Make instead? [see-also: https://developer.mozilla.org/en/Gmake_vs._Pymake])
endif
endif # Windows
