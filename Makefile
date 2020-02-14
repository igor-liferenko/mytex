all:
	@g++ -o mkpool -std=c++14 mkpool.cpp
	@mkdir -p .build/
	@ctie -m .build/rstex.h.pre rstex.h.pre rstex.h.ch
	@ctie -m .build/rstex.cpp.pre rstex.cpp.pre rstex.cpp.ch
	@./mkpool TEX_STRING .build/rstex.cpp.pre .build/rstex.h.pre
	@g++ -g -o initex -O0 -std=c++14 -Wno-unused-result -Wno-dangling-else .build/rstex.cpp -DNO_DEBUG
	@g++ -g -o virtex -O0 -std=c++14 -Wno-unused-result -Wno-dangling-else .build/rstex.cpp -DNO_DEBUG -DNO_INIT
	@./initex plain.ini
	@./initex lhplain.ini
	@sed /hoffset/,/catcode...=12/d plain.ini >plain-no-offset.ini
	@./initex plain-no-offset.ini
	@sed /hoffset/,/catcode...=12/d lhplain.ini >lhplain-no-offset.ini
	@./initex lhplain-no-offset.ini
