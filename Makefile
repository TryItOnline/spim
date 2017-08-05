#.SUFFIXES:
#.SUFFIXES: .cpp .o

MYLEX = flex
LEXFLAGS += -I -8 -o lex.yy.cpp

YACC=bison
YFLAGS += -d --defines=parser_yacc.h --output=parser_yacc.cpp -p yy

MEM_SIZES = -DTEXT_SIZE=65536 -DDATA_SIZE=131072 -DK_TEXT_SIZE=65536

DEFINES = $(MEM_SIZES) -DDEFAULT_EXCEPTION_HANDLER="\"$(CURDIR)/exceptions.s\""

CXX = g++
CXXFLAGS += -I. $(DEFINES) -O -g -Wall -pedantic -Wextra -Wunused -Wno-write-strings -x c++
YCFLAGS +=
LDFLAGS += -lm

LEXCFLAGS += -O $(CXXFLAGS)

OBJS = spim.o spim-utils.o run.o mem.o inst.o data.o sym-tbl.o parser_yacc.o lex.yy.o \
       syscall.o display-utils.o string-stream.o


spim:   $(OBJS)
	$(CXX) -g $(OBJS) $(LDFLAGS) -o spim -lm


clean:
	rm -f spim *.o lex.yy.cpp parser_yacc.cpp parser_yacc.h

# Dependences not handled well by makedepend:

parser_yacc.h: parser_yacc.cpp

parser_yacc.cpp: parser.y
	$(YACC) $(YFLAGS) parser.y

parser_yacc.o: parser_yacc.cpp
	$(CXX) $(CXXFLAGS) $(YCFLAGS) -c parser_yacc.cpp


lex.yy.cpp: scanner.l
	$(MYLEX) $(LEXFLAGS) scanner.l

lex.yy.o: lex.yy.cpp
	$(CXX) $(LEXCFLAGS) -c lex.yy.cpp


# DO NOT DELETE THIS LINE -- make depend depends on it.

data.o: spim.h
data.o: string-stream.h
data.o: spim-utils.h
data.o: inst.h
data.o: reg.h
data.o: mem.h
data.o: sym-tbl.h
data.o: parser.h
data.o: run.h
data.o: data.h
display-utils.o: spim.h
display-utils.o: string-stream.h
display-utils.o: spim-utils.h
display-utils.o: inst.h
display-utils.o: data.h
display-utils.o: reg.h
display-utils.o: mem.h
display-utils.o: run.h
display-utils.o: sym-tbl.h
dump_ops.o: op.h
inst.o: spim.h
inst.o: string-stream.h
inst.o: spim-utils.h
inst.o: inst.h
inst.o: reg.h
inst.o: mem.h
inst.o: sym-tbl.h
inst.o: parser.h
inst.o: scanner.h
inst.o: parser_yacc.h
inst.o: data.h
inst.o: op.h
mem.o: spim.h
mem.o: string-stream.h
mem.o: spim-utils.h
mem.o: inst.h
mem.o: reg.h
mem.o: mem.h
run.o: spim.h
run.o: string-stream.h
run.o: spim-utils.h
run.o: inst.h
run.o: reg.h
run.o: mem.h
run.o: sym-tbl.h
run.o: parser_yacc.h
run.o: syscall.h
run.o: run.h
spim-utils.o: spim.h
spim-utils.o: string-stream.h
spim-utils.o: spim-utils.h
spim-utils.o: inst.h
spim-utils.o: data.h
spim-utils.o: reg.h
spim-utils.o: mem.h
spim-utils.o: scanner.h
spim-utils.o: parser.h
spim-utils.o: parser_yacc.h
spim-utils.o: run.h
spim-utils.o: sym-tbl.h
string-stream.o: spim.h
string-stream.o: string-stream.h
sym-tbl.o: spim.h
sym-tbl.o: string-stream.h
sym-tbl.o: spim-utils.h
sym-tbl.o: inst.h
sym-tbl.o: reg.h
sym-tbl.o: mem.h
sym-tbl.o: data.h
sym-tbl.o: parser.h
sym-tbl.o: sym-tbl.h
sym-tbl.o: parser_yacc.h
syscall.o: spim.h
syscall.o: string-stream.h
syscall.o: inst.h
syscall.o: reg.h
syscall.o: mem.h
syscall.o: sym-tbl.h
syscall.o: syscall.h
lex.yy.o: spim.h
lex.yy.o: string-stream.h
lex.yy.o: spim-utils.h
lex.yy.o: inst.h
lex.yy.o: reg.h
lex.yy.o: sym-tbl.h
lex.yy.o: parser.h
lex.yy.o: scanner.h
lex.yy.o: parser_yacc.h
lex.yy.o: op.h
spim.o: spim.h
spim.o: string-stream.h
spim.o: spim-utils.h
spim.o: inst.h
spim.o: reg.h
spim.o: mem.h
spim.o: parser.h
spim.o: sym-tbl.h
spim.o: scanner.h
spim.o: parser_yacc.h
parser_yacc.o: spim.h
parser_yacc.o: string-stream.h
parser_yacc.o: spim-utils.h
parser_yacc.o: inst.h
parser_yacc.o: reg.h
parser_yacc.o: mem.h
parser_yacc.o: sym-tbl.h
parser_yacc.o: data.h
parser_yacc.o: scanner.h
parser_yacc.o: parser.h
