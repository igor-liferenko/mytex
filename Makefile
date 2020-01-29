all:
	@g++ -o mkpool -std=c++14 mkpool.cpp
	@ctie -m rstex.h.pre vanilla/rstex.h.pre rstex.h.ch
	@./mkpool TEX_STRING rstex.cpp.pre rstex.h.pre
	@rm rstex.h.pre
	@g++ -o initex -O3 -std=c++14 -Wno-unused-result -Wno-dangling-else rstex.cpp -DNO_DEBUG
	@g++ -o virtex -O3 -std=c++14 -Wno-unused-result -Wno-dangling-else rstex.cpp -DNO_DEBUG -DNO_INIT
	@./initex /home/user/tex/lhplain.ini && mv lhplain.fmt mytex.fmt && rm lhplain.log
