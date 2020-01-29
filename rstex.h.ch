@x
This is the vanilla version of rstex with minimal changes from the original tex.web.
@y
This is the unix specific version of rstex.
@z

@x
#define banner "This is rsTeX, Version 1.1.6" // printed when rsTeX starts
@y
#define banner "This is rsTeX, Version 1.1.7 for Unix" // printed when rsTeX starts
@z

@x
const int mem_max = 30000; // Greatest index in rsTeX's internal mem array; must be strictly less than
@y
const int mem_max = 500000; // Greatest index in rsTeX's internal mem array; must be strictly less than
@z

@x
const int stack_size = 200; // Maximum number of simultaneous input sources
const int max_in_open = 6; // Maximum number of input files and error insertions that can be going on simultaneously
const int font_max = 75; // Maximum internal font number; must not exceed max_quarterword and must be at most font_base + 256
const int font_mem_size = 20000; // Number of words of font_info for all fonts
const int param_size = 60; // Maximum number of simultaneous macro parameters
const int nest_size = 40; // Maximum number of semantic levels simultaneously active
const int max_strings = 3000; // Maximum number of strings; must not exceed max_halfword
const int string_vacancies = 8000; // The minimum number of characters that should be available for the user's
@y
const int stack_size = 1000; // Maximum number of simultaneous input sources
const int max_in_open = 60; // Maximum number of input files and error insertions that can be going on simultaneously
const int font_max = 255; // Maximum internal font number; must not exceed max_quarterword and must be at most font_base + 256
const int font_mem_size = 100000; // Number of words of font_info for all fonts
const int param_size = 200; // Maximum number of simultaneous macro parameters
const int nest_size = 200; // Maximum number of semantic levels simultaneously active
const int max_strings = 20000; // Maximum number of strings; must not exceed max_halfword
const int string_vacancies = 20000; // The minimum number of characters that should be available for the user's
@z

@x
const int pool_size = 40000; // Maximum number of characters in strings, including all error messages and help texts,
@y
const int pool_size = 300000; // Maximum number of characters in strings, including all error messages and help texts,
@z

@x
const int save_size = 600; // Space for saving values outside of current group; must be at most max_halfword
@y
const int save_size = 1200; // Space for saving values outside of current group; must be at most max_halfword
@z

@x
const int dvi_buf_size = 800; // size of the output buffer; must be a multiple of 8
const int file_name_size = 40; // File names shouldn't be longer than this
const char pool_name[file_name_size+1] = "tex.pool"; // String of file_name_size; tells where the string pool appears
@y
const int dvi_buf_size = 2400; // size of the output buffer; must be a multiple of 8
const int file_name_size = 1024; // File names shouldn't be longer than this
const char pool_name[] = "tex.pool"; // String of file_name_size; tells where the string pool appears
@z

@x
		overflow(/*pool size*/1290, pool_size - init_pool_ptr);\
@y
		overflow(/*pool size*/1288, pool_size - init_pool_ptr);\
@z

@x
	print_nl(/*! */1291);\
@y
	print_nl(/*! */1289);\
@z

@x
const int mem_top = 30000; // largest index in the mem_array dumped by INITEX; must be substantially larger
@y
const int mem_top = 500000; // largest index in the mem_array dumped by INITEX; must be substantially larger
@z

@x
const int hash_size = 2100; // maximum number of control sequences; it should be at most about (mem_max - mem_min) / 10
const int hash_prime = 1777; // a prime number equal to about 85% of hash_size
@y
const int hash_size = 21000; // maximum number of control sequences; it should be at most about (mem_max - mem_min) / 10
const int hash_prime = 16249; // a prime number equal to about 85% of hash_size
@z

@x
int name_length; // This many characters are actually relevant in name_of_file (the rest are blank) NOTE: We don't really follow this convention in C
@y
//int name_length; // This many characters are actually relevant in name_of_file (the rest are blank) NOTE: We don't really follow this convention in C

//////////////////////////////////////////////
// System dependent addition for paths
Array<char, 1, file_name_size + 1> real_name_of_file;


//////////////////////////////////////////////

@z

@x
const int max_halfword = 65535; // Largest allowable value in halfword
@y
const int max_halfword = 1073741823; // Largest allowable value in halfword
@z

@x
typedef unsigned short halfword; // min_halfword..max_halfword, 1/2 of a word, NOTE: This part assumes min_halfword=0
typedef unsigned char two_choices; // 1..2, Used when there are two variants in a record
typedef unsigned char four_choices; // 1..4, Used when there are four variants in a record
@y
typedef int halfword; // min_halfword..max_halfword, 1/2 of a word, NOTE: This part assumes min_halfword=0
//typedef unsigned char two_choices; // 1..2, Used when there are two variants in a record
//typedef unsigned char four_choices; // 1..4, Used when there are four variants in a record
@z

@x
		overflow(/*save size*/1292,save_size);\
@y
		overflow(/*save size*/1290,save_size);\
@z

@x
		overflow(/*input stack size*/1293, stack_size);\
@y
		overflow(/*input stack size*/1291, stack_size);\
@z

@x
pool_pointer area_delimiter; // the most recent `>' or `:', if any
pool_pointer ext_delimiter; // the relevant `.', if any
@y
pool_pointer area_delimiter; // the most recent `/', if any
pool_pointer ext_delimiter; // the most recent `.', if any
@z

@x
#define TEX_area /**/591 // NOTE: I don't use any paths at all for now
#define TEX_font_area /**/591 // NOTE: I don't use any paths at all for now
@y
//#define TEX_area /**/591 // NOTE: I don't use any paths at all for now
//#define TEX_font_area /**/591 // NOTE: I don't use any paths at all for now
@z

@x
		pack_job_name(/*.dvi*/1294);\
@y
		pack_job_name(/*.dvi*/1292);\
@z

@x
			prompt_file_name(/*file name for output*/1295, /*.dvi*/1294);\
@y
			prompt_file_name(/*file name for output*/1293, /*.dvi*/1292);\
@z

@x
		print(/* scaled */1296);\
@y
		print(/* scaled */1294);\
@z

@x
Array<quarterword, int_base, eqtb_size> xeq_level;
@y
Array<quarterword, int_base, eqtb_size> xeq_level;

///////////////////////////////////////////////////////////////////////////
// System specific addition on windows

#define MAX_INPUT_CHARS 700
#define default_input_path ".:..:/home/tex/local/lib:/home/tex/dist/lib"
#define MAX_OTH_PATH_CHARS 200
#define default_font_path "/home/fonts"
#define default_format_path ".:/home/tex/local/tex"
#define default_pool_path ".:/home/tex/local/tex"

#define edit_file input_stack[base_ptr]

pool_pointer ed_name_start;
int ed_name_length;
int edit_line;

char input_path[MAX_INPUT_CHARS] = default_input_path;
char font_path[MAX_OTH_PATH_CHARS] = default_font_path;
char format_path[MAX_OTH_PATH_CHARS] = default_format_path;
char pool_path[MAX_OTH_PATH_CHARS] = default_pool_path;

const int no_file_path = 0;
const int input_file_path = 1;
const int read_file_path = 2;
const int font_file_path = 3;
const int format_file_path = 4;
const int pool_file_path = 5;

///////////////////////////////////////////////////////////////////////////


@z

@x
#define format_extension /*.fmt*/1297 // the extension as a WEB constant
@y
#define format_extension /*.fmt*/1295 // the extension as a WEB constant
@z

@x
#define math_spacing /*0234000122*4000133**3**344*0400400*000000234000111*1111112341011*/1298
@y
#define math_spacing /*0234000122*4000133**3**344*0400400*000000234000111*1111112341011*/1296
@z

@x
int ready_already; // a sacrifice of purity for economy
@y
//int ready_already; // a sacrifice of purity for economy
@z

@x
bool a_open_in(FILE **f);
@y
bool a_open_in(FILE **f, int path_specifier);
@z

@x
void print_word(memory_word w);
@y
bool test_access(int filepath);
void call_edit(packed_ASCII_code *filename, int fnlength, int linenumber);
@z
