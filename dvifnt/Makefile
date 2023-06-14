all:
	tie -c dvifnt.ch ../cdvitype.w ~/dvitype/path.ch ~/dvitype/arg.ch fnt.ch >/dev/null
	ctangle ../cdvitype.w dvifnt dvifnt
	@sed -i '/stdlib.h/a #ifdef _SYS_SYSMACROS_H\n#undef major\n#undef minor\n#endif' dvifnt.c
	gcc dvifnt.c -o dvifnt -lm
