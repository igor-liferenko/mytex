all:
	tie -c dvifont.ch ../cdvitype.w ~/dvitype/path.ch ~/dvitype/arg.ch font.ch >/dev/null
	ctangle ../cdvitype.w dvifont dvifont
	@sed -i '/stdlib.h/a #ifdef _SYS_SYSMACROS_H\n#undef major\n#undef minor\n#endif' dvifont.c
	gcc dvifont.c -o dvifont -lm
