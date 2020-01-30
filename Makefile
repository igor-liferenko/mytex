all:
	@g++ -o mkpool -std=c++14 mkpool.cpp
	@mkdir -p .build/
	@ctie -m .build/rstex.h.pre rstex.h.pre rstex.h.ch
	@ctie -m .build/rstex.cpp.pre rstex.cpp.pre rstex.cpp.ch
	@./mkpool TEX_STRING .build/rstex.cpp.pre .build/rstex.h.pre
	@g++ -g -o initex -O3 -std=c++14 -Wno-unused-result -Wno-dangling-else .build/rstex.cpp -DNO_DEBUG
	@g++ -g -o virtex -O3 -std=c++14 -Wno-unused-result -Wno-dangling-else .build/rstex.cpp -DNO_DEBUG -DNO_INIT
	@./initex /home/user/tex/lhplain.ini && mv lhplain.fmt mytex.fmt && rm lhplain.log
