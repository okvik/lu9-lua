</$objtype/mkfile

CFLAGS=-FTV -p -I../shim -DLUA_USE_PLAN9 -DLUA_UCID

CORETARG=liblua.a$O
COREOBJS=\
	lapi.$O\
	lcode.$O\
	lctype.$O\
	ldebug.$O\
	ldo.$O\
	ldump.$O\
	lfunc.$O\
	lgc.$O\
	llex.$O\
	lmem.$O\
	lobject.$O\
	lopcodes.$O\
	lparser.$O\
	lstate.$O\
	lstring.$O\
	ltable.$O\
	ltm.$O\
	lundump.$O\
	lvm.$O\
	lzio.$O\
	ltests.$O\
	lauxlib.$O

LIBOBJS=\
	lbaselib.$O\
	ldblib.$O\
	liolib.$O\
	lmathlib.$O\
#	loslib.$O\
	los9lib.$O\
	ltablib.$O\
	lstrlib.$O\
	lutf8lib.$O\
	loadlib.$O\
	lcorolib.$O\
	linit.$O

ALLOBJS=$COREOBJS $LIBOBJS
ALLTARG=$CORETARG $LUATARG

all:V: $CORETARG $LUATARG

clean:V:
	rm -f $LUATARG *.[$OS] *.a[$OS]

$CORETARG: $COREOBJS $LIBOBJS
	ar cr $target $prereq

%.$O: %.c
	$CC $CFLAGS $stem.c
