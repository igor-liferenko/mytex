all:
	@g++ -o mkpool -std=c++14 mkpool.cpp
	@mkdir -p .build/
	@ctie -m .build/rstex.h.pre rstex.h.pre rstex.h.ch
	@cp vanilla/rstex.cpp.pre .build/ # ctie
	@./mkpool TEX_STRING .build/rstex.cpp.pre .build/rstex.h.pre
	@g++ -o initex -O3 -std=c++14 -Wno-unused-result -Wno-dangling-else rstex.cpp -DNO_DEBUG
	@g++ -o virtex -O3 -std=c++14 -Wno-unused-result -Wno-dangling-else rstex.cpp -DNO_DEBUG -DNO_INIT
	@./initex /home/user/tex/lhplain.ini && mv lhplain.fmt mytex.fmt && rm lhplain.log
