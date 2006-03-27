################################################################################
#
# Borland MAKE Makefile for PDCurses library - Win32 BC++ 4.0+
#
# Usage: make -f [path\]bccwin32.mak [-DDEBUG] [target]
#
# where target can be any of:
# [all|demos|pdcurses.lib|panel.lib|testcurs.exe...]
#
################################################################################
#
# First, set the environment variable PDCURSES_SRCDIR, or edit the line
# below; for example, "set PDCURSES_SRCDIR=c:\pdcurses".
#
################################################################################
PDCURSES_HOME	= $(PDCURSES_SRCDIR)
################################################################################
# Nothing below here should require changing.
################################################################################

!include $(PDCURSES_HOME)\version

PDCURSES_CURSES_H	= $(PDCURSES_HOME)\curses.h
PDCURSES_CURSPRIV_H	= $(PDCURSES_HOME)\curspriv.h
PDCURSES_HEADERS	= $(PDCURSES_CURSES_H) $(PDCURSES_CURSPRIV_H)
PANEL_HEADER		= $(PDCURSES_HOME)\panel.h
TERM_HEADER		= $(PDCURSES_HOME)\term.h

srcdir		= $(PDCURSES_HOME)\pdcurses
osdir		= $(PDCURSES_HOME)\win32
pandir		= $(PDCURSES_HOME)\panel
demodir		= $(PDCURSES_HOME)\demos

CC		= bcc32 -q

!if $d(DEBUG)
CFLAGS		= -N -v -y -DPDCDEBUG
!else
CFLAGS		= -O -w-par
!endif

CPPFLAGS	= -I$(PDCURSES_HOME)

CCFLAGS		= -c -Tpe -w32 $(CFLAGS) $(CPPFLAGS)

LIBEXE		= tlib /C /E

LIBCURSES	= pdcurses.lib
LIBPANEL	= panel.lib

PDCLIBS		= $(LIBCURSES) $(LIBPANEL)
DEMOS		= testcurs.exe newdemo.exe xmas.exe tuidemo.exe \
firework.exe ptest.exe rain.exe worm.exe

################################################################################
all:	$(PDCLIBS) $(DEMOS)

clean:
	-del *.obj
	-del *.lib
	-del *.map
	-del *.tds
	-del *.exe

demos:	$(DEMOS)

#------------------------------------------------------------------------

LIBOBJS = addch.obj addchstr.obj addstr.obj attr.obj beep.obj bkgd.obj \
border.obj clear.obj color.obj delch.obj deleteln.obj getch.obj \
getstr.obj getyx.obj inch.obj inchstr.obj initscr.obj inopts.obj \
insch.obj insstr.obj instr.obj kernel.obj mouse.obj move.obj outopts.obj \
overlay.obj pad.obj printw.obj refresh.obj scanw.obj scr_dump.obj \
scroll.obj slk.obj termattr.obj terminfo.obj touch.obj util.obj \
window.obj

PDCOBJS = pdcclip.obj pdcdebug.obj pdcdisp.obj pdcgetsc.obj pdckbd.obj \
pdcscrn.obj pdcsetsc.obj pdcutil.obj pdcwin.obj

PANOBJS = panel.obj


first:
	@echo $(srcdir)\addch.c

pdcurses.lib : $(LIBOBJS) $(PDCOBJS)
	$(LIBEXE) $@ @$(osdir)\bccwin32.lrf

panel.lib : $(PANOBJS)
	$(LIBEXE) $@ -+$(PANOBJS)

addch.obj: $(srcdir)\addch.c $(PDCURSES_HEADERS)
	$(CC) $(CCFLAGS) -o$@ $(srcdir)\addch.c

addchstr.obj: $(srcdir)\addchstr.c $(PDCURSES_HEADERS)
	$(CC) $(CCFLAGS) -o$@ $(srcdir)\addchstr.c

addstr.obj: $(srcdir)\addstr.c $(PDCURSES_HEADERS)
	$(CC) $(CCFLAGS) -o$@ $(srcdir)\addstr.c

attr.obj: $(srcdir)\attr.c $(PDCURSES_HEADERS)
	$(CC) $(CCFLAGS) -o$@ $(srcdir)\attr.c

beep.obj: $(srcdir)\beep.c $(PDCURSES_HEADERS)
	$(CC) $(CCFLAGS) -o$@ $(srcdir)\beep.c

bkgd.obj: $(srcdir)\bkgd.c $(PDCURSES_HEADERS)
	$(CC) $(CCFLAGS) -o$@ $(srcdir)\bkgd.c

border.obj: $(srcdir)\border.c $(PDCURSES_HEADERS)
	$(CC) $(CCFLAGS) -o$@ $(srcdir)\border.c

clear.obj: $(srcdir)\clear.c $(PDCURSES_HEADERS)
	$(CC) $(CCFLAGS) -o$@ $(srcdir)\clear.c

color.obj: $(srcdir)\color.c $(PDCURSES_HEADERS)
	$(CC) $(CCFLAGS) -o$@ $(srcdir)\color.c

delch.obj: $(srcdir)\delch.c $(PDCURSES_HEADERS)
	$(CC) $(CCFLAGS) -o$@ $(srcdir)\delch.c

deleteln.obj: $(srcdir)\deleteln.c $(PDCURSES_HEADERS)
	$(CC) $(CCFLAGS) -o$@ $(srcdir)\deleteln.c

getch.obj: $(srcdir)\getch.c $(PDCURSES_HEADERS)
	$(CC) $(CCFLAGS) -o$@ $(srcdir)\getch.c

getstr.obj: $(srcdir)\getstr.c $(PDCURSES_HEADERS)
	$(CC) $(CCFLAGS) -o$@ $(srcdir)\getstr.c

getyx.obj: $(srcdir)\getyx.c $(PDCURSES_HEADERS)
	$(CC) $(CCFLAGS) -o$@ $(srcdir)\getyx.c

inch.obj: $(srcdir)\inch.c $(PDCURSES_HEADERS)
	$(CC) $(CCFLAGS) -o$@ $(srcdir)\inch.c

inchstr.obj: $(srcdir)\inchstr.c $(PDCURSES_HEADERS)
	$(CC) $(CCFLAGS) -o$@ $(srcdir)\inchstr.c

initscr.obj: $(srcdir)\initscr.c $(PDCURSES_HEADERS)
	$(CC) $(CCFLAGS) -o$@ $(srcdir)\initscr.c

inopts.obj: $(srcdir)\inopts.c $(PDCURSES_HEADERS)
	$(CC) $(CCFLAGS) -o$@ $(srcdir)\inopts.c

insch.obj: $(srcdir)\insch.c $(PDCURSES_HEADERS)
	$(CC) $(CCFLAGS) -o$@ $(srcdir)\insch.c

insstr.obj: $(srcdir)\insstr.c $(PDCURSES_HEADERS)
	$(CC) $(CCFLAGS) -o$@ $(srcdir)\insstr.c

instr.obj: $(srcdir)\instr.c $(PDCURSES_HEADERS)
	$(CC) $(CCFLAGS) -o$@ $(srcdir)\instr.c

kernel.obj: $(srcdir)\kernel.c $(PDCURSES_HEADERS)
	$(CC) $(CCFLAGS) -o$@ $(srcdir)\kernel.c

mouse.obj: $(srcdir)\mouse.c $(PDCURSES_HEADERS)
	$(CC) $(CCFLAGS) -o$@ $(srcdir)\mouse.c

move.obj: $(srcdir)\move.c $(PDCURSES_HEADERS)
	$(CC) $(CCFLAGS) -o$@ $(srcdir)\move.c

outopts.obj: $(srcdir)\outopts.c $(PDCURSES_HEADERS)
	$(CC) $(CCFLAGS) -o$@ $(srcdir)\outopts.c

overlay.obj: $(srcdir)\overlay.c $(PDCURSES_HEADERS)
	$(CC) $(CCFLAGS) -o$@ $(srcdir)\overlay.c

pad.obj: $(srcdir)\pad.c $(PDCURSES_HEADERS)
	$(CC) $(CCFLAGS) -o$@ $(srcdir)\pad.c

printw.obj: $(srcdir)\printw.c $(PDCURSES_HEADERS)
	$(CC) $(CCFLAGS) -o$@ $(srcdir)\printw.c

refresh.obj: $(srcdir)\refresh.c $(PDCURSES_HEADERS)
	$(CC) $(CCFLAGS) -o$@ $(srcdir)\refresh.c

scanw.obj: $(srcdir)\scanw.c $(PDCURSES_HEADERS)
	$(CC) $(CCFLAGS) -o$@ $(srcdir)\scanw.c

scr_dump.obj: $(srcdir)\scr_dump.c $(PDCURSES_HEADERS)
	$(CC) $(CCFLAGS) -o$@ $(srcdir)\scr_dump.c

scroll.obj: $(srcdir)\scroll.c $(PDCURSES_HEADERS)
	$(CC) $(CCFLAGS) -o$@ $(srcdir)\scroll.c

slk.obj: $(srcdir)\slk.c $(PDCURSES_HEADERS)
	$(CC) $(CCFLAGS) -o$@ $(srcdir)\slk.c

termattr.obj: $(srcdir)\termattr.c $(PDCURSES_HEADERS)
	$(CC) $(CCFLAGS) -o$@ $(srcdir)\termattr.c

terminfo.obj: $(srcdir)\terminfo.c $(PDCURSES_HEADERS) $(TERM_HEADER)
	$(CC) $(CCFLAGS) -o$@ $(srcdir)\terminfo.c

touch.obj: $(srcdir)\touch.c $(PDCURSES_HEADERS)
	$(CC) $(CCFLAGS) -o$@ $(srcdir)\touch.c

util.obj: $(srcdir)\util.c $(PDCURSES_HEADERS)
	$(CC) $(CCFLAGS) -o$@ $(srcdir)\util.c

window.obj: $(srcdir)\window.c $(PDCURSES_HEADERS)
	$(CC) $(CCFLAGS) -o$@ $(srcdir)\window.c


pdcclip.obj: $(osdir)\pdcclip.c $(PDCURSES_HEADERS)
	$(CC) $(CCFLAGS) -o$@ $(osdir)\pdcclip.c

pdcdebug.obj: $(srcdir)\pdcdebug.c $(PDCURSES_HEADERS)
	$(CC) $(CCFLAGS) -o$@ $(srcdir)\pdcdebug.c

pdcdisp.obj: $(osdir)\pdcdisp.c $(PDCURSES_HEADERS)
	$(CC) $(CCFLAGS) -o$@ $(osdir)\pdcdisp.c

pdcgetsc.obj: $(osdir)\pdcgetsc.c $(PDCURSES_HEADERS)
	$(CC) $(CCFLAGS) -o$@ $(osdir)\pdcgetsc.c

pdckbd.obj: $(osdir)\pdckbd.c $(PDCURSES_HEADERS)
	$(CC) $(CCFLAGS) -o$@ $(osdir)\pdckbd.c

pdcscrn.obj: $(osdir)\pdcscrn.c $(PDCURSES_HEADERS)
	$(CC) $(CCFLAGS) -o$@ $(osdir)\pdcscrn.c

pdcsetsc.obj: $(osdir)\pdcsetsc.c $(PDCURSES_HEADERS)
	$(CC) $(CCFLAGS) -o$@ $(osdir)\pdcsetsc.c

pdcutil.obj: $(srcdir)\pdcutil.c $(PDCURSES_HEADERS)
	$(CC) $(CCFLAGS) -o$@ $(srcdir)\pdcutil.c

pdcwin.obj: $(srcdir)\pdcwin.c $(PDCURSES_HEADERS)
	$(CC) $(CCFLAGS) -o$@ $(srcdir)\pdcwin.c

#------------------------------------------------------------------------

panel.obj: $(pandir)\panel.c $(PDCURSES_HEADERS) $(PANEL_HEADER)
	$(CC) $(CCFLAGS) -o$@ $(pandir)\panel.c

#------------------------------------------------------------------------

firework.exe:	firework.obj $(LIBCURSES)
	$(CC) -e$@ $**

newdemo.exe:	newdemo.obj $(LIBCURSES)
	$(CC) -e$@ $**

ptest.exe:	ptest.obj $(LIBCURSES) $(LIBPANEL)
	$(CC) -e$@ $**

rain.exe:	rain.obj $(LIBCURSES)
	$(CC) -e$@ $**

testcurs.exe:	testcurs.obj $(LIBCURSES)
	$(CC) -e$@ $**

tuidemo.exe:	tuidemo.obj tui.obj $(LIBCURSES)
	$(CC) -e$@ $**

worm.exe:	worm.obj $(LIBCURSES)
	$(CC) -e$@ $**

xmas.exe:	xmas.obj $(LIBCURSES)
	$(CC) -e$@ $**


firework.obj: $(demodir)\firework.c $(PDCURSES_CURSES_H)
	$(CC) $(CCFLAGS) -o$@ $(demodir)\firework.c

newdemo.obj: $(demodir)\newdemo.c $(PDCURSES_CURSES_H)
	$(CC) $(CCFLAGS) -o$@ $(demodir)\newdemo.c

ptest.obj: $(demodir)\ptest.c $(PANEL_HEADER) $(PDCURSES_CURSES_H)
	$(CC) $(CCFLAGS) -o$@ $(demodir)\ptest.c

rain.obj: $(demodir)\rain.c $(PDCURSES_CURSES_H)
	$(CC) $(CCFLAGS) -o$@ $(demodir)\rain.c

testcurs.obj: $(demodir)\testcurs.c $(PDCURSES_CURSES_H)
	$(CC) $(CCFLAGS) -o$@ $(demodir)\testcurs.c

tui.obj: $(demodir)\tui.c $(demodir)\tui.h $(PDCURSES_CURSES_H)
	$(CC) $(CCFLAGS) -I$(demodir) -o$@ $(demodir)\tui.c

tuidemo.obj: $(demodir)\tuidemo.c $(PDCURSES_CURSES_H)
	$(CC) $(CCFLAGS) -I$(demodir) -o$@ $(demodir)\tuidemo.c

worm.obj: $(demodir)\worm.c $(PDCURSES_CURSES_H)
	$(CC) $(CCFLAGS) -o$@ $(demodir)\worm.c

xmas.obj: $(demodir)\xmas.c $(PDCURSES_CURSES_H)
	$(CC) $(CCFLAGS) -o$@ $(demodir)\xmas.c

dist: $(PDCLIBS)
	echo PDCurses $(VERDOT) for Borland C++ Win32 > file_id.diz
	echo ------------------------------------------ >> file_id.diz
	echo Public Domain Curses library for >> file_id.diz
	echo Borland C/C++ 5.5 for Win32. >> file_id.diz
	echo Source available in PDCURS$(VER).ZIP >> file_id.diz
	echo Public Domain. >> file_id.diz
	zip -9jX pdc$(VER)_bcc_w32 \
	$(PDCURSES_HOME)\README $(PDCURSES_HOME)\HISTORY \
	$(PDCURSES_HOME)\maintain.er \
	$(PDCURSES_HOME)\curses.h $(PDCURSES_HOME)\curspriv.h \
	$(PDCURSES_HOME)\panel.h $(PDCURSES_HOME)\term.h \
	$(LIBCURSES) $(LIBPANEL) file_id.diz
	del file_id.diz
