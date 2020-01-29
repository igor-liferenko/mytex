all:
	@g++ -o cpf -std=c++14 CreatePoolFile/CreatePoolFile.cpp
	@./cpf TEX_STRING rstex.cpp.pre rstex.h.pre
	@g++ -o initex -O3 -std=c++14 -Wno-unused-result -Wno-dangling-else rstex.cpp -DNO_DEBUG
	@g++ -o virtex -O3 -std=c++14 -Wno-unused-result -Wno-dangling-else rstex.cpp -DNO_DEBUG -DNO_INIT
